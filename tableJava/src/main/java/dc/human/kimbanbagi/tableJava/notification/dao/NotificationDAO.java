package dc.human.kimbanbagi.tableJava.notification.dao;

import dc.human.kimbanbagi.tableJava.notification.vo.NotificationVO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("notificationDAO")
public interface NotificationDAO {
    // 사용자
    public List<NotificationVO> getUserNotifications(String userId) throws DataAccessException;
    public int addUserNotification(NotificationVO notificationVO) throws DataAccessException;

    // 사장님
    public List<NotificationVO> getOwnerNotifications(String restaurantId) throws DataAccessException;
    public int addOwnerNotification(NotificationVO notificationVO) throws DataAccessException;
}
