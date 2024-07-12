package dc.human.kimbanbagi.tableJava.owner.controller;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface OwnerController {
    // 페이지 이동
    public ModelAndView ownerMainPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    );
    public ModelAndView ownerBookListPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    );
    public ModelAndView ownerWaitListPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    );
    public ModelAndView ownerNotificationPage (
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    );
    public ModelAndView ownerMyPage (
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    );

    public ModelAndView addRestaurant(
            @ModelAttribute("restaurant")RestaurantVO restaurant
    );

    public ModelAndView updateRStatus(
            @RequestParam(name="status") String status,
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName,
            @RequestParam(name="bookId") String bookId
    );

    public ModelAndView updateWStatus(
            @RequestParam(name="status") String status,
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName,
            @RequestParam(name="waitId") String waitId
    );

    public ModelAndView updateProfile(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @ModelAttribute() UserVO owner
    );

}
