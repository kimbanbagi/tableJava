package dc.human.kimbanbagi.tableJava.notification.service;

import dc.human.kimbanbagi.tableJava.notification.vo.NotificationVO;
import dc.human.kimbanbagi.tableJava.book.vo.BookVO;
import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;

import java.util.List;

public interface NotificationService {
    public List<NotificationVO> getUserNotifications(String userId);
    public List<NotificationVO> getOwnerNotifications(String restaurantId);

    // 예약
    public int addBookNotification(BookVO book);
    public int bookCancelFromUser(String userId, String restaurantId, String restaurantName);
    public int confirmBookNotification(String bookId, String restaurantName);
    public int bookCancelFromOwner(String bookId, String restaurantId, String restaurantName);
    public int endBookNotification(String bookId, String restaurantId, String restaurantName);

    // 웨이팅
    public int addWaitNotification(WaitVO wait);
    public int confirmWaitNotification(String waitId, String restaurantName);
    public int waitCancelFromUser(String userId, String restaurantId, String restaurantName);
    public int waitCancelFromOwner(String waitId, String restaurantId, String restaurantName);
    public int endWaitNotification(String waitId, String restaurantId, String restaurantName);
}
