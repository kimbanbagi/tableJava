package dc.human.kimbanbagi.tableJava.user.controller;

import dc.human.kimbanbagi.tableJava.book.vo.BookVO;
import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;
import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface UserController {
    // 페이지 이동
    public ModelAndView userMainPage(@RequestParam(name="userId") String userId);
    public ModelAndView userBookListPage(@RequestParam(name="userId") String userId);
    public ModelAndView userWaitListPage(@RequestParam(name="userId") String userId);
    public ModelAndView userNotificationPage(@RequestParam(name="userId") String userId);
    public ModelAndView userMyPage(@RequestParam(name="userId") String userId);
    public ModelAndView bookPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName
    );
    public ModelAndView waitPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName
    );

    public ModelAndView reviewPage(
           @RequestParam(name="userId") String userId,
           @RequestParam(name="restaurantId") String restaurantId,
           @RequestParam(name="restaurantName") String restaurantName,
           @RequestParam(name="restaurantDate") String restaurantDate,
           @RequestParam(name="restaurantTime") String restaurantTime
    );

    public ModelAndView review(
            @RequestParam(name="uId") String userId,
            @RequestParam(name="rId") String restaurantId,
            @RequestParam(name="review") String review,
            @RequestParam(name="star") String star
    );

    public ModelAndView search(
            @RequestParam(name="keywords") String keywords,
            @RequestParam(name="userId") String userId
    );

    public ModelAndView restaurantDetail(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="keywords") String keywords
    );

    public ModelAndView book(@ModelAttribute BookVO book);

    public ModelAndView cancelBook(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName
    );

    public ModelAndView wait(@ModelAttribute WaitVO wait);

    public ModelAndView cancelWait (
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName
    );

    public ModelAndView updateProfile(
            @RequestParam(name="userId") String userId,
            @ModelAttribute() UserVO user
    );
}
