package dc.human.kimbanbagi.tableJava.wait.service;

import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;

import java.util.List;

public interface UserWaitService {
    public List<WaitVO> getUserWaitList(String userId);
    public String getNextNumber(String restaurantId);
    public int addWait(WaitVO wait);
}
