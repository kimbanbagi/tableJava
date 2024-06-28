package dc.human.kimbanbagi.tableJava.common.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("loginDAO")
public interface LoginDAO {
    public String login(String userId, String userPwd) throws DataAccessException;
    public String tempCheck(String userId, String userPwd) throws DataAccessException;
    public String getRegister(String userId) throws DataAccessException;
    public String findID(String name, String email) throws DataAccessException;
    public int findPW(String userId, String userName) throws DataAccessException;
    public void addTempPW(String tempPW, String userId) throws DataAccessException;
}
