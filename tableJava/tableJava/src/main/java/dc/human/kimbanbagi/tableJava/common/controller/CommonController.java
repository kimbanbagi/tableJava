package dc.human.kimbanbagi.tableJava.common.controller;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CommonController {
    public ModelAndView loginPage();
    public ModelAndView joinPage();
    public ModelAndView findIDPage();
    public ModelAndView findPWPage();
    public ModelAndView changePwdPage(@RequestParam(name="userId") String userId);

    public ModelAndView login(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userPwd") String userPwd
    );

    public ModelAndView join (@ModelAttribute UserVO user);
    public String idCheck(@RequestParam(name= "uId") String userId); // 아이디 중복 확인 메소드 추가

    public ModelAndView findID(
            @RequestParam(name="name") String name,
            @RequestParam(name="email") String email
    );

    public ModelAndView findPW(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userName") String uName
    );

    public ModelAndView updatePwd(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="currPwd") String currPwd,
            @RequestParam(name="newPwd") String newPwd
    );

    public ModelAndView logout();


}
