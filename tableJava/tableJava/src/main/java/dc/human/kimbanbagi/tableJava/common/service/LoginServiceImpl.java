package dc.human.kimbanbagi.tableJava.common.service;

import dc.human.kimbanbagi.tableJava.common.dao.LoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Random;

@Service("loginService")
@Transactional(propagation = Propagation.REQUIRED)
public class LoginServiceImpl implements LoginService{
    @Autowired
    private LoginDAO loginDAO;

    @Override
    public String login(String userId, String userPwd) {
        String userRole = loginDAO.login(userId, userPwd);

        if(userRole == null || "".equals(userRole)){
            userRole = loginDAO.tempCheck(userId, userPwd);
        }

        return userRole;
    }

    @Override
    public String getRegister(String userId)  {
        return loginDAO.getRegister(userId);
    }

    @Override
    public String findID(String name, String email)  {
        return loginDAO.findID(name, email);
    }

    @Override
    public String findPW(String userId, String userName)  {
        int result = loginDAO.findPW(userId, userName);
        String tempPW = "";

        if(result == 1){
            tempPW = randomPW(8);
            loginDAO.addTempPW(tempPW, userId);
        }

        return tempPW;
    }

    public static String randomPW(int range) {
        StringBuilder sb = new StringBuilder();
        Random rd = new Random();

        for(int i=0;i<range;i++){
            if(rd.nextBoolean()){
                sb.append(rd.nextInt(10));
            }else {
                sb.append((char)(rd.nextInt(26)+65));
            }
        }

        return sb.toString();
    }

}
