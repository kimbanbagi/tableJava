package dc.human.kimbanbagi.tableJava.owner.service;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;

import dc.human.kimbanbagi.tableJava.owner.dao.OwnerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("ownerService")
@Transactional(propagation = Propagation.REQUIRED)
public class OwnerServiceImpl implements OwnerService {

    @Autowired
    private OwnerDAO ownerDAO;

    @Override
    public UserVO getOwnerInfo(String userId){
        return ownerDAO.getOwnerInfo(userId);
    }
}
