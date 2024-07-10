package dc.human.kimbanbagi.tableJava.owner.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("statsDAO")
public interface StatsDAO {
    public int getRCount (String restaurantId) throws DataAccessException;
    public int getRCancelFromUser(String restaurantId) throws DataAccessException;
    public int getRCancelFromOwner(String restaurantId) throws DataAccessException;
    public int getREndSuccess (String restaurantId) throws DataAccessException;

    public int get1Star(String restaurantId) throws DataAccessException;
    public int get2Star(String restaurantId) throws DataAccessException;
    public int get3Star(String restaurantId) throws DataAccessException;
    public int get4Star(String restaurantId) throws DataAccessException;
    public int get5Star(String restaurantId) throws DataAccessException;
}
