package dc.human.kimbanbagi.tableJava.user.service;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;

public interface UserService {
    public UserVO getUserInfo (String userId);
    public int updateProfile(UserVO user);
}
