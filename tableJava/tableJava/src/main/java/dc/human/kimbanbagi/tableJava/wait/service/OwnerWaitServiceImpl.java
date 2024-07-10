package dc.human.kimbanbagi.tableJava.wait.service;

import dc.human.kimbanbagi.tableJava.notification.vo.NotificationVO;
import dc.human.kimbanbagi.tableJava.wait.dao.WaitDAO;
import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("ownerWaitService")
@Transactional(propagation = Propagation.REQUIRED)
public class OwnerWaitServiceImpl implements OwnerWaitService {

    @Autowired
    private WaitDAO waitDAO;

    @Override
    public List<WaitVO> getOwnerWaitList(String restaurantId){
        return waitDAO.getOwnerWaitList(restaurantId);
    }

    @Override
    public int confirmWait(String waitId, String restaurantId) {
       return waitDAO.confirmWait(waitId, restaurantId);
    }

    @Override
    public int cancelWait(String waitId, String restaurantId){
        return waitDAO.cancelWaitFromOwner(waitId, restaurantId);
    }

    @Override
    public int endWait(String waitId, String restaurantId){
        return waitDAO.endWait(waitId, restaurantId);
    }
}
