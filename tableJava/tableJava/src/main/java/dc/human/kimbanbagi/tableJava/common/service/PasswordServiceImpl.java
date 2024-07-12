package dc.human.kimbanbagi.tableJava.common.service;

import dc.human.kimbanbagi.tableJava.common.dao.PasswordDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("passwordService")
@Transactional(propagation = Propagation.REQUIRED)
public class PasswordServiceImpl implements PasswordService {
    @Autowired
    private PasswordDAO passwordDAO;

    @Override
    public int updatePwd (String userId, String currPwd, String newPwd){
        int result = 0;

        result = passwordDAO.checkPwd(userId, currPwd);

        if(result == 1){
            result = passwordDAO.updatePwd(userId, newPwd);
        }else {
            result = 0;
        }

        return result;
    }
}
