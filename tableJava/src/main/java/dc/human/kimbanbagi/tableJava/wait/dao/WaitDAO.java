package dc.human.kimbanbagi.tableJava.wait.dao;

import dc.human.kimbanbagi.tableJava.wait.vo.WaitVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("waitDAO")
public interface WaitDAO {
    // 사용자
    public List<WaitVO> getUserWaitList(String userId) throws DataAccessException;
    public String getNextNumber(String restaurantId) throws DataAccessException;
    public int addWait(WaitVO wait) throws DataAccessException;
    public int cancelWaitFromUser(String userId, String restaurantId) throws DataAccessException;

    // 사장님
    public List<WaitVO> getOwnerWaitList(String restaurantId) throws DataAccessException;
    public int cancelWaitFromOwner(String waitId, String restaurantId) throws DataAccessException;
    public int confirmWait(String waitId, String restaurantId) throws DataAccessException;
    public int endWait(String waitId, String restaurantId) throws DataAccessException;
}
