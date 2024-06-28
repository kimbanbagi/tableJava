package dc.human.kimbanbagi.tableJava.common.service;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;

public interface JoinService {

    public int addJoin (UserVO user);
    public boolean idCheck(String uId);
}
