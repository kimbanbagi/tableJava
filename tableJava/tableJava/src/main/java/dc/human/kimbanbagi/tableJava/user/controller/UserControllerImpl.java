package dc.human.kimbanbagi.tableJava.user.controller;


import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import dc.human.kimbanbagi.tableJava.notification.service.NotificationService;
import dc.human.kimbanbagi.tableJava.notification.vo.NotificationVO;

import dc.human.kimbanbagi.tableJava.book.service.UserBookService;
import dc.human.kimbanbagi.tableJava.restaurant.service.UserRestaurantService;
import dc.human.kimbanbagi.tableJava.review.service.ReviewService;
import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;
import dc.human.kimbanbagi.tableJava.user.service.UserService;
import dc.human.kimbanbagi.tableJava.wait.service.UserWaitService;

import dc.human.kimbanbagi.tableJava.book.vo.BookVO;
import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;

import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserControllerImpl implements UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRestaurantService userRestaurantService;

    @Autowired
    private UserBookService userBookService;

    @Autowired
    private UserWaitService userWaitService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private ReviewService reviewService;

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/userMainPage")
    public ModelAndView userMainPage(@RequestParam(name="userId") String userId){
        ModelAndView mav = new ModelAndView();

        try{
            UserVO user = userService.getUserInfo(userId);

            mav.addObject("user", user);
            mav.addObject("userId", userId);
            mav.setViewName("userMain");

        }catch(Exception e){
            e.printStackTrace();
        }

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/userBookListPage")
    public ModelAndView userBookListPage(@RequestParam(name="userId") String userId){
        ModelAndView mav = new ModelAndView();

        try {
            List<BookVO> bookList = userBookService.getUserBookList(userId);

            mav.addObject("bookList", bookList);
            mav.setViewName("userBookList");

        }catch(Exception e) {
            e.printStackTrace();
        }

        mav.addObject("userId", userId);

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/userNotificationPage")
    public ModelAndView userNotificationPage(@RequestParam(name="userId") String userId){
        ModelAndView mav = new ModelAndView();

        try {
            List<NotificationVO> notifications = notificationService.getUserNotifications(userId);
            mav.addObject("notifications", notifications);

        }catch(Exception e) {
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.setViewName("userNotification");

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/userMyPage")
    public ModelAndView userMyPage(@RequestParam(name="userId") String userId){
        ModelAndView mav = new ModelAndView();

        try {
            UserVO user = userService.getUserInfo(userId);
            List<BookVO> history = userBookService.getHistory(userId);

            mav.addObject("user", user);
            mav.addObject("history", history);
            mav.setViewName("userMyPage");

        }catch(Exception e) {
            e.printStackTrace();
        }

        mav.addObject("userId", userId);

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/userWaitListPage")
    public ModelAndView userWaitListPage(@RequestParam(name="userId") String userId){
        ModelAndView mav = new ModelAndView();

        try {
            List<WaitVO> waitList = userWaitService.getUserWaitList(userId);
            mav.addObject("waitList", waitList);

        }catch(Exception e) {
            e.printStackTrace();
        }
        mav.addObject("userId", userId);
        mav.setViewName("userWaitList");

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value = "/reviewPage")
    public ModelAndView reviewPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName,
            @RequestParam(name="restaurantDate") String restaurantDate,
            @RequestParam(name="restaurantTime") String restaurantTime
    ){
        ModelAndView mav = new ModelAndView();
        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);
        mav.addObject("restaurantName", restaurantName);
        mav.addObject("restaurantDate", restaurantDate);
        mav.addObject("restaurantTime", restaurantTime);

        mav.setViewName("review");

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST,value = "/review")
    public ModelAndView review(
            @ModelAttribute ReviewVO review
    ){
        ModelAndView mav = new ModelAndView();
        try{
            int result = 0;
            result = reviewService.addReview(review);

            if(result == 0){
                //error
            } else{
                mav.setViewName("userMyPage");
            }

        } catch(Exception e){
            e.printStackTrace();
        }
        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/search")
    public ModelAndView search(
            @RequestParam(name="keywords") String keywords,
            @RequestParam(name="userId") String userId
    ){
        ModelAndView mav = new ModelAndView();

        try {
            List<RestaurantVO> searchResult = userRestaurantService.findRestaurant(keywords);
            mav.addObject("searchResult", searchResult);

        }catch (Exception e) {
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.setViewName("search");

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/restaurantDetail")
    public ModelAndView restaurantDetail(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    ){
        ModelAndView mav = new ModelAndView();

        try {
            RestaurantVO restaurant = userRestaurantService.getRestaurantDetail(restaurantId);
            mav.addObject("restaurant", restaurant);

        }catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);
        mav.setViewName("restaurantDetail");
        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/bookPage")
    public ModelAndView bookPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName
    ){
        ModelAndView mav = new ModelAndView();

        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);
        mav.addObject("restaurantName", restaurantName);
        mav.setViewName("book");

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/waitPage")
    public ModelAndView waitPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName
    ){
        ModelAndView mav = new ModelAndView();

        int nextNumber = 1;

        try {
                nextNumber = Integer.parseInt(userWaitService.getNextNumber(restaurantId))+1;

        }catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("nextNumber", nextNumber);
        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);
        mav.addObject("restaurantName", restaurantName);
        mav.setViewName("wait");

        return mav;

    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/book")
    public ModelAndView book(@ModelAttribute BookVO book){
        ModelAndView mav = new ModelAndView();

        String userId = book.getuId();

        book.setrStatus("0");

        try {
            int result = 0;
            result = userBookService.addBook(book);

            if(result == 0) {
                //예약 실패 시 처리 코드 작성
            }else {
                result = notificationService.addBookNotification(book);

                if(result == 1){
                    mav.addObject("book", book);
                    mav.addObject("userId", userId);
                    mav.setViewName("bookSuccess");
                }else {
                    //error
                }

            }
        }catch(Exception e) {
            e.printStackTrace();
        }

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/bookCancelFromUser")
    public ModelAndView cancelBook (
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName
    ){
        ModelAndView mav = new ModelAndView();

        try {
            int result = 0;
            result = userBookService.cancelBook(userId, restaurantId);

            if(result==0){
                //취소 실패 시 코드 작성
            }else{

                result = notificationService.bookCancelFromUser(userId, restaurantId, restaurantName);

                if(result == 1){
                    List<BookVO> bookList = userBookService.getUserBookList(userId);

                    mav.addObject("bookList", bookList);
                }else {
                    // error
                }

            }
        }catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.setViewName("userBookList");

        return mav;

    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/wait")
    public ModelAndView wait(@ModelAttribute WaitVO wait){
        ModelAndView mav = new ModelAndView();

        String userId = wait.getuId();

        wait.setwStatus("0");

        try {
            int result = 0;
            result = userWaitService.addWait(wait);

            if(result == 0) {
                //웨이팅 실패 시 처리 코드 작성
            }else {

                result = notificationService.addWaitNotification(wait);

                if(result == 1){
                    mav.addObject("wait", wait);
                    mav.addObject("userId", userId);
                    mav.setViewName("waitSuccess");
                }else {
                    //error
                }

            }
        } catch(Exception e){
            e.printStackTrace();
        }

        return mav;
    }
}
