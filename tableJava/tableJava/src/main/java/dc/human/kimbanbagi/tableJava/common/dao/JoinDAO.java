package dc.human.kimbanbagi.tableJava.common.dao;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("joinDAO")
public interface JoinDAO {

    public int addJoin(UserVO user) throws DataAccessException;

    //아이디 중복 확인 메소드
    public int idCheck(String userId) throws DataAccessException;
}
