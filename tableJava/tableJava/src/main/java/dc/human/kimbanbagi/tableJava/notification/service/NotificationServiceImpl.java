package dc.human.kimbanbagi.tableJava.notification.service;

import dc.human.kimbanbagi.tableJava.notification.dao.NotificationDAO;
import dc.human.kimbanbagi.tableJava.notification.vo.NotificationVO;
import dc.human.kimbanbagi.tableJava.book.vo.BookVO;
import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

@Service("notificationService")
@Transactional(propagation = Propagation.REQUIRED)
public class NotificationServiceImpl implements NotificationService{

    @Autowired
    private NotificationDAO notificationDAO;

    java.util.Date now = new java.util.Date();
    Date sqlDate = new Date(now.getTime());

    // 알림 메세지에 추가 될 사용자, 사장님 별 코멘드 enum
    public enum Comments {
        U_BOOK_A("예약 신청이 완료 되었습니다."), O_BOOK_A("새로운 예약이 들어왔습니다."), BOOK_C("예약이 확정 되었습니다."), C_BOOK("예약이 취소 되었습니다."),
        U_BOOK_C("손님 측에서 예약을 취소했습니다."), O_BOOK_C("식당 측에서 예약을 취소했습니다."), BOOK_E("예약이 종료 되었습니다."),
        U_WAIT_A("웨이팅 신청이 완료 되었습니다."), O_WAIT_A("새로운 대기 팀이 있습니다."), WAIT_C("차례가 되었습니다. 식당에 방문해주세요."), C_WAIT("웨이팅이 취소 되었습니다."),
        U_WAIT_C("손님 측에서 웨이팅을 취소했습니다."), O_WAIT_C("식당 측에서 웨이팅을 취소했습니다."), WAIT_E("웨이팅이 종료 되었습니다.");

        private final String value;

        Comments(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }

    @Override
    public List<NotificationVO> getUserNotifications(String userId){
        return notificationDAO.getUserNotifications(userId);
    }

    @Override
    public List<NotificationVO> getOwnerNotifications(String restaurantId){
        return notificationDAO.getOwnerNotifications(restaurantId);
    }

    @Override
    public int addBookNotification(BookVO book){
        int result = 0;

        NotificationVO nVo = new NotificationVO();

        nVo.setuId(book.getuId());
        nVo.setrName(book.getrName());
        nVo.setComments(Comments.U_BOOK_A.getValue());
        nVo.setCreatedDate(sqlDate);

        result = notificationDAO.addUserNotification(nVo);

        if(result == 1){
            NotificationVO nVo_ = new NotificationVO();

            nVo_.setrId(book.getrId());
            nVo_.setrName(book.getrName());
            nVo_.setComments(Comments.O_BOOK_A.getValue());
            nVo_.setCreatedDate(sqlDate);

            result = notificationDAO.addOwnerNotification(nVo_);

        } else {
            result = 0;
        }

        return result;

    }

    public int bookCancelFromUser(
            String userId, String restaurantId, String restaurantName
    ){
        int result = 0;

        NotificationVO nVo = new NotificationVO();

        nVo.setuId(userId);
        nVo.setrName(restaurantName);
        nVo.setComments(Comments.C_BOOK.getValue());
        nVo.setCreatedDate(sqlDate);

        result = notificationDAO.addUserNotification(nVo);

        if(result == 1){
            NotificationVO nVo_ = new NotificationVO();

            nVo_.setrId(restaurantId);
            nVo_.setrName(restaurantName);
            nVo_.setComments(Comments.U_BOOK_C.getValue());
            nVo_.setCreatedDate(sqlDate);

            result = notificationDAO.addOwnerNotification(nVo_);

        } else {
            result = 0;
        }

        return result;

    }

    public int addWaitNotification(WaitVO wait){
        int result = 0;

        NotificationVO nVo = new NotificationVO();

        nVo.setuId(wait.getuId());
        nVo.setrName(wait.getrName());
        nVo.sethCount(wait.gethCount());
        nVo.setwNumber(wait.getwNumber());
        nVo.setComments(Comments.U_WAIT_A.getValue());
        nVo.setCreatedDate(sqlDate);

        result = notificationDAO.addUserNotification(nVo);

        if(result == 1){
            NotificationVO nVo_ = new NotificationVO();

            nVo_.setrId(wait.getrId());
            nVo_.setrName(wait.getrName());
            nVo_.sethCount(wait.gethCount());
            nVo_.setwNumber(wait.getwNumber());
            nVo_.setComments(Comments.O_WAIT_A.getValue());
            nVo_.setCreatedDate(sqlDate);

            result = notificationDAO.addOwnerNotification(nVo_);
        }else {
            result = 0;
        }

        return result;
    }
}
