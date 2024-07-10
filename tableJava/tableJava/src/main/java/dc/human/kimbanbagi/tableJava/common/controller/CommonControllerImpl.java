package dc.human.kimbanbagi.tableJava.common.controller;

import dc.human.kimbanbagi.tableJava.common.service.JoinService;
import dc.human.kimbanbagi.tableJava.common.service.LoginService;
import dc.human.kimbanbagi.tableJava.common.service.PasswordService;
import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import dc.human.kimbanbagi.tableJava.restaurant.service.OwnerRestaurantService;
import dc.human.kimbanbagi.tableJava.restaurant.service.UserRestaurantService;
import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;

import dc.human.kimbanbagi.tableJava.review.service.ReviewService;
import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;
import dc.human.kimbanbagi.tableJava.user.service.UserService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CommonControllerImpl implements CommonController {
    @Autowired
    private LoginService loginService;

    @Autowired
    private JoinService joinService;

    @Autowired
    private PasswordService passwordService;

    @Autowired
    private UserRestaurantService userRestaurantService;

    @Autowired
    private OwnerRestaurantService ownerRestaurantService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private UserService userService;

    private RestaurantVO restaurant;

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/loginPage")
    public ModelAndView loginPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/joinPage")
    public ModelAndView joinPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("join");
        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/findIDPage")
    public ModelAndView findIDPage(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("findID");
        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/findPWPage")
    public ModelAndView findPWPage(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("findPW");
        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/changePwdPage")
    public ModelAndView changePwdPage(@RequestParam(name="userId") String userId){
        ModelAndView mav = new ModelAndView();

        mav.addObject("userId", userId);
        mav.setViewName("changePwd");

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/login")
    public ModelAndView login(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userPwd") String userPwd
    )  {

        ModelAndView mav = new ModelAndView();

        try {
            String msg="";
            String viewName = "";
            String userRole = loginService.login(userId, userPwd);

            if(userRole == null || "".equals(userRole)) {

                msg = "일치하는 회원 정보가 없습니다.";
                mav.addObject("msgFailed", msg);
                viewName = "login";

            } else if("U".equals(userRole)){

                UserVO user = userService.getUserInfo(userId);

                mav.addObject("user", user);
                mav.addObject("userId", userId);

                List<RestaurantVO> recommendList = userRestaurantService.recommendList();
                mav.addObject("recommendList", recommendList);

                RestaurantVO randomRestaurant = userRestaurantService.randomRestaurant();
                String randomRId = randomRestaurant.getrId();
                ReviewVO randomReview = reviewService.randomReview(randomRId);

                mav.addObject("randomRestaurant", randomRestaurant);
                mav.addObject("randomReview", randomReview);

                viewName = "userMain";

            }else if("O".equals(userRole)) {

                String register = loginService.getRegister(userId);

                if("T".equals(register)){
                    viewName = "ownerMain";

                    restaurant = ownerRestaurantService.getResInfo(userId);
                    String restaurantId = restaurant.getrId();

                    mav.addObject("restaurant", restaurant);
                    mav.addObject("userId", userId);
                    mav.addObject("restaurantId", restaurantId);

                }else {

                    viewName = "register";
                    mav.addObject("userId", userId);

                }

            }else {
                // error
            }

            mav.setViewName(viewName);

        }catch(Exception e){
            System.out.println(e.getMessage());
        }

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/join")
    public ModelAndView join(@ModelAttribute UserVO user) {
        ModelAndView mav = new ModelAndView();

        try {
            int result = joinService.addJoin(user);

            if(result == 1){

                String msg = "회원 가입에 성공했습니다!";
                mav.addObject("msgSuccess", msg);
                mav.setViewName("login");

            }else{

                String msg = "회원 가입에 실패했습니다. 다시 시도해주세요.";

                mav.addObject("msgFailed", msg);
                mav.setViewName("join");
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam(name="uId") String uId){
        boolean isAvailable = joinService.idCheck(uId);
        return isAvailable ? "이미 사용 중인 아이디입니다." : "사용 가능한 아이디입니다.";
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/findID")
    public ModelAndView findID(
            @RequestParam(name="name") String name,
            @RequestParam(name="email") String email
    ){
        ModelAndView mav = new ModelAndView();

        try{
            String viewName = "" ;
            String userId = loginService.findID(name, email);

            if(userId == null || "".equals(userId)){
                viewName = "join";
            } else {
                viewName = "findID_OK";
                mav.addObject("userId", userId);
            }

            mav.setViewName(viewName);

        } catch (Exception ex){
            ex.printStackTrace();
        }
        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/findPW")
    public ModelAndView findPW(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userName") String uName
    ) {

        ModelAndView mav = new ModelAndView();
        String tempPW = "";
        String msg="";

        try {
            tempPW = loginService.findPW(userId, uName);
        } catch(Exception e){
            e.printStackTrace();
        }

        if(tempPW == null || "".equals(tempPW)){
            msg = "일치하는 회원 정보를 찾을 수 없습니다.";
            mav.addObject("msg", msg);
            mav.setViewName("findPW");
        }else {
            mav.addObject("tempPW", tempPW);
            mav.setViewName("findPW_done");
        }

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/updatePwd")
    public ModelAndView updatePwd(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="currPwd") String currPwd,
            @RequestParam(name="newPwd") String newPwd
    ){
        ModelAndView mav = new ModelAndView();

        try{
            int result = 0;

            result = passwordService.updatePwd(userId, currPwd, newPwd);

            if(result == 0){
                String msg = "기존 비밀번호와 불일치합니다.";

                mav.addObject("msgFailed", msg);
            }else {
                String msg = "비밀번호가 변경되었습니다. 다시 로그인 해주세요.";
                mav.addObject("msgSuccess", msg);
            }

            mav.setViewName("login");


        }catch(Exception e){

        }

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/logout")
    public ModelAndView logout(){
        ModelAndView mav = new ModelAndView();

        mav.addObject("userId","");
        mav.addObject("restaurantId", "");
        mav.setViewName("login");

        return mav;
    }
}
