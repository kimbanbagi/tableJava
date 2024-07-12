package dc.human.kimbanbagi.tableJava.owner.service;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import dc.human.kimbanbagi.tableJava.owner.vo.StatsVO;

public interface OwnerService {
    public UserVO getOwnerInfo(String userId);
    public int updateProfile(UserVO owner);

    public StatsVO getStats(String restaurantId);
}
