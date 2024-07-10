package dc.human.kimbanbagi.tableJava.wait.service;

import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;

import java.util.List;

public interface OwnerWaitService {
    public List<WaitVO> getOwnerWaitList(String restaurantId);
    public int confirmWait(String waitId, String restaurantId);
    public int cancelWait(String waitId, String restaurantId);
    public int endWait(String waitId, String restaurantId);
}
