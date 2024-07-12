package dc.human.kimbanbagi.tableJava.wait.service;

import dc.human.kimbanbagi.tableJava.wait.dao.WaitDAO;
import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

@Service("userWaitService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserWaitServiceImpl implements UserWaitService {
    @Autowired
    private WaitDAO waitDAO;

    java.util.Date now = new java.util.Date();
    Date sqlDate = new Date(now.getTime());

    @Override
    public List<WaitVO> getUserWaitList(String userId){

        return waitDAO.getUserWaitList(userId);
    }

    @Override
    public String getNextNumber(String restaurantId) {

        return waitDAO.getNextNumber(restaurantId);
    }

    @Override
    public int addWait (WaitVO wait) {
        wait.setCreatedDate(sqlDate);

        return waitDAO.addWait(wait);
    }

    @Override
    public int cancelWait(String userId, String restaurantId){
        return waitDAO.cancelWaitFromUser(userId, restaurantId);
    }
}
