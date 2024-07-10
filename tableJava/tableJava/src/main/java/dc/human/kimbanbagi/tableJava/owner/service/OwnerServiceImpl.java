package dc.human.kimbanbagi.tableJava.owner.service;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;

import dc.human.kimbanbagi.tableJava.owner.dao.OwnerDAO;
import dc.human.kimbanbagi.tableJava.owner.dao.StatsDAO;
import dc.human.kimbanbagi.tableJava.owner.vo.StatsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("ownerService")
@Transactional(propagation = Propagation.REQUIRED)
public class OwnerServiceImpl implements OwnerService {

    @Autowired
    private OwnerDAO ownerDAO;

    @Autowired
    private StatsDAO statsDAO;

    @Override
    public UserVO getOwnerInfo(String userId){
        return ownerDAO.getOwnerInfo(userId);
    }

    @Override
    public int updateProfile(UserVO owner){
        return ownerDAO.updateProfile(owner);
    }

    @Override
    public StatsVO getStats(String restaurantId) {
        StatsVO stats = new StatsVO();
        stats.setrCount(statsDAO.getRCount(restaurantId));
        stats.setrCancelFromUser(statsDAO.getRCancelFromUser(restaurantId));
        stats.setrCancelFromOwner(statsDAO.getRCancelFromOwner(restaurantId));
        stats.setrEndSuccess(statsDAO.getREndSuccess(restaurantId));

        stats.setOneStar(statsDAO.get1Star(restaurantId));
        stats.setTwoStar(statsDAO.get2Star(restaurantId));
        stats.setThreeStar(statsDAO.get3Star(restaurantId));
        stats.setFourStar(statsDAO.get4Star(restaurantId));
        stats.setFiveStar(statsDAO.get5Star(restaurantId));

        return stats;
    }
}
