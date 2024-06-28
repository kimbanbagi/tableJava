package dc.human.kimbanbagi.tableJava.user.dao;


import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;



@Mapper
@Repository("userDAO")
public interface UserDAO {
    public UserVO getUserInfo(String userId) throws DataAccessException;
}
