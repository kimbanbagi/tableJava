package dc.human.kimbanbagi.tableJava.owner.controller;

import dc.human.kimbanbagi.tableJava.book.service.OwnerBookService;
import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import dc.human.kimbanbagi.tableJava.notification.service.NotificationService;
import dc.human.kimbanbagi.tableJava.notification.vo.NotificationVO;
import dc.human.kimbanbagi.tableJava.owner.service.OwnerService;
import dc.human.kimbanbagi.tableJava.owner.vo.StatsVO;
import dc.human.kimbanbagi.tableJava.restaurant.service.OwnerRestaurantService;
import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;
import dc.human.kimbanbagi.tableJava.book.vo.BookVO;

import dc.human.kimbanbagi.tableJava.review.service.ReviewService;
import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;
import dc.human.kimbanbagi.tableJava.wait.service.OwnerWaitService;
import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.*;

@Controller
public class OwnerControllerImpl implements OwnerController {
    @Autowired
    private OwnerService ownerService;

    @Autowired
    private OwnerRestaurantService ownerRestaurantService;

    @Autowired
    private OwnerBookService ownerBookService;

    @Autowired
    private OwnerWaitService ownerWaitService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private ReviewService reviewService;


    @Override
    @RequestMapping(method = RequestMethod.POST, value="/ownerMainPage")
    public ModelAndView ownerMainPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    ){
        ModelAndView mav = new ModelAndView();

        try {
            RestaurantVO restaurant = ownerRestaurantService.getResInfo(userId);

            StatsVO stats = ownerService.getStats(restaurantId);

            mav.addObject("restaurant", restaurant);
            mav.addObject("stats",stats);

        }catch(Exception e) {
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);
        mav.setViewName("ownerMain");

        return mav;

    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/ownerBookListPage")
    public ModelAndView ownerBookListPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    ){
        ModelAndView mav = new ModelAndView();

        try {
            int result = 0;
            List<BookVO> bookList = ownerBookService.getOwnerBookList(restaurantId);

            mav.addObject("bookList", bookList);
            mav.setViewName("ownerBookList");

        } catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);

        return mav;

    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/ownerWaitListPage")
    public ModelAndView ownerWaitListPage(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    ){
        ModelAndView mav = new ModelAndView();

        try {
            List<WaitVO> waitList = ownerWaitService.getOwnerWaitList(restaurantId);

            mav.addObject("waitList", waitList);
            mav.setViewName("ownerWaitList");

        } catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/ownerNotificationPage")
    public ModelAndView ownerNotificationPage (
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    ){
        ModelAndView mav = new ModelAndView();

        try {
            List<NotificationVO> notifications = notificationService.getOwnerNotifications(restaurantId);

            mav.addObject("notifications", notifications);
            mav.setViewName("ownerNotification");

        }catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);

        return mav;

    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/ownerMyPage")
    public ModelAndView ownerMyPage (
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId
    ){
        ModelAndView mav = new ModelAndView();

        try {
            UserVO owner = ownerService.getOwnerInfo(userId);
            List<ReviewVO> reviews = reviewService.getReviewList(restaurantId);

            mav.addObject("owner", owner);
            mav.addObject("reviews", reviews);
            mav.setViewName("ownerMyPage");

        }catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId", userId);
        mav.addObject("restaurantId", restaurantId);

        return mav;

    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/register")
    public ModelAndView addRestaurant(
            @ModelAttribute("restaurant")RestaurantVO restaurant
    ) {

        ModelAndView mav = new ModelAndView();

        String userId = restaurant.getuId();
        String restaurantId = restaurant.getrId();

        try {
            int result = 0;

            MultipartFile file = restaurant.getrPhoto();
            String CURR_IMAGE_REPO_PATH = "C:/tableJava_files/owner/restaurant/";
            file.transferTo(new File(CURR_IMAGE_REPO_PATH+ file.getOriginalFilename()));

            String relativePath = "/files/owner/restaurant/";

            restaurant.setFileName(relativePath + file.getOriginalFilename());
            result = ownerRestaurantService.addRestaurant(restaurant);

            if(result == 0){
                String msg = "식당 등록에 실패했습니다. 다시 시도해주세요.";
                mav.addObject("msg", msg);
                mav.setViewName("register");
            }else {

                result = ownerRestaurantService.updateRegister(userId);

                if(result == 0){
                    // error
                }else {

                    mav.addObject("restaurant", restaurant);
                    mav.setViewName("ownerMain");
                }

            }
        } catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId",userId);
        mav.addObject("restaurantId",restaurantId);

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/updateRStatus")
    public ModelAndView updateRStatus(
            @RequestParam(name="status") String status,
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName,
            @RequestParam(name="bookId") String bookId
    ){
        ModelAndView mav = new ModelAndView();

        int result = 0;

        try {
            if(status.equals("1")){
                result = ownerBookService.confirmBook(bookId, restaurantId);

                if(result == 1) {
                    result = notificationService.confirmBookNotification(bookId, restaurantName);
                }

            } else if(status.equals("3")){
                result = ownerBookService.cancelBook(bookId, restaurantId);

                if(result == 1){
                    result = notificationService.bookCancelFromOwner(bookId, restaurantId, restaurantName);
                }

            } else if(status.equals("4")){
                result = ownerBookService.endBook(bookId, restaurantId);

                if(result == 1){
                    result = notificationService.endBookNotification(bookId, restaurantId, restaurantName);
                }

            } else {
                // error
            }

            if(result == 1){

                List<BookVO> bookList = ownerBookService.getOwnerBookList(restaurantId);

                mav.addObject("bookList", bookList);
                mav.setViewName("ownerBookList");

            }else {
                //error
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId",userId);
        mav.addObject("restaurantId",restaurantId);

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/updateWStatus")
    public ModelAndView updateWStatus(
            @RequestParam(name="status") String status,
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @RequestParam(name="restaurantName") String restaurantName,
            @RequestParam(name="waitId") String waitId
    )
    {
        ModelAndView mav = new ModelAndView();

        int result = 0;

        try {
            if(status.equals("1")){
                result = ownerWaitService.confirmWait(waitId, restaurantId);

                if(result == 1){
                    result = notificationService.confirmWaitNotification(waitId, restaurantId);
                }

            } else if(status.equals("3")){
                result = ownerWaitService.cancelWait(waitId, restaurantId);

                if(result == 1){
                    result = notificationService.waitCancelFromOwner(waitId, restaurantId, restaurantName);
                }

            } else if(status.equals("4")){
                result = ownerWaitService.endWait(waitId, restaurantId);

                if(result==1){
                    result = notificationService.endWaitNotification(waitId, restaurantId, restaurantName);
                }
            }else {
                // error
            }

            if(result == 1){
                List<WaitVO> waitList = ownerWaitService.getOwnerWaitList(restaurantId);

                mav.addObject("waitList", waitList);
                mav.setViewName("ownerWaitList");

            }else {
                //error
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        mav.addObject("userId",userId);
        mav.addObject("restaurantId",restaurantId);

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/updateOwnerProfile")
    public ModelAndView updateProfile(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="restaurantId") String restaurantId,
            @ModelAttribute() UserVO owner
    ){
        ModelAndView mav = new ModelAndView();

        String msg = "";

        try {
            int result = 0;

            MultipartFile file = owner.getuImage();
            String CURR_IMAGE_REPO_PATH = "C:/tableJava_files/owner/profile/";
            file.transferTo(new File(CURR_IMAGE_REPO_PATH+ file.getOriginalFilename()));

            String relativePath = "/files/owner/profile/";

            owner.setFileName(relativePath + file.getOriginalFilename());

            result = ownerService.updateProfile(owner);

            if(result == 1){
                msg = "프로필이 변경 되었습니다.";

                mav.addObject("msgSuccess", msg);

            }else {
                msg = "변경 사항 저장에 실패했습니다.";

                mav.addObject("msgFailed", msg);
            }

            UserVO ownerInfo = ownerService.getOwnerInfo(userId);

            mav.addObject("owner", ownerInfo);
            mav.addObject("userId",userId);
            mav.addObject("restaurantId",restaurantId);

            mav.setViewName("ownerMyPage");

        }catch(Exception e){
            e.printStackTrace();
        }


        return mav;
    }



}
