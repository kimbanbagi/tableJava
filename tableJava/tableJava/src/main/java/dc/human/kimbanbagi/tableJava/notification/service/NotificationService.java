package dc.human.kimbanbagi.tableJava.notification.service;

import dc.human.kimbanbagi.tableJava.notification.vo.NotificationVO;
import dc.human.kimbanbagi.tableJava.book.vo.BookVO;
import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;

import java.util.List;

public interface NotificationService {
    public List<NotificationVO> getUserNotifications(String userId);
    public List<NotificationVO> getOwnerNotifications(String restaurantId);

    public int addBookNotification(BookVO book);
    public int bookCancelFromUser(String userId, String restaurantId, String restaurantName);

    public int addWaitNotification(WaitVO wait);
}
