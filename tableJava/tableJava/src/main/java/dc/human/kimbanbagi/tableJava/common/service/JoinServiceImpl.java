package dc.human.kimbanbagi.tableJava.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import dc.human.kimbanbagi.tableJava.common.dao.JoinDAO;
import org.springframework.transaction.annotation.Transactional;
import dc.human.kimbanbagi.tableJava.common.vo.UserVO;

import java.sql.Date;

@Service("joinService")
@Transactional(propagation = Propagation.REQUIRED)
public class JoinServiceImpl implements JoinService {

    @Autowired
    private JoinDAO joinDAO;

    String PROFILE_IMAGE_INIT_PATH = "image/user.png";

    java.util.Date now = new java.util.Date();
    Date sqlDate = new Date(now.getTime());

    @Override
    public int addJoin(UserVO user) {

        // 사용자 역할 설정
        String role = user.getuRole();

        if ("customer".equals(role)) {
            user.setuRole("U");
        } else {
            user.setuRole("O");
        }

        // 가게 등록 여부 초기 설정
        user.setRegister("F");

        // 회원 탈퇴 여부 초기 설정
        user.setWithdrawal("F");

        // 회원 등급 초기 설정
        user.setGrade("A");

        // 프로필 기본 이미지 설정
        user.setFileName(PROFILE_IMAGE_INIT_PATH);

        // createdDate 설정
        user.setCreatedDate(sqlDate);

        return joinDAO.addJoin(user);
    }

    @Override
    public boolean idCheck(String uId) {
        int count = joinDAO.idCheck(uId);
        return count > 0; // count가 0보다 크면 true, 그렇지 않으면 false
    }

}
