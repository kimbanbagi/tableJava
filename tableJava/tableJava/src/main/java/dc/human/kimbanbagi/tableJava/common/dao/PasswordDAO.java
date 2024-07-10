package dc.human.kimbanbagi.tableJava.common.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("passwordDAO")
public interface PasswordDAO {
    public int checkPwd(String userId, String currPwd) throws DataAccessException;
    public int updatePwd(String userId, String newPwd) throws DataAccessException;
}
