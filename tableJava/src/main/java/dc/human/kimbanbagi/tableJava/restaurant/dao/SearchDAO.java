package dc.human.kimbanbagi.tableJava.restaurant.dao;

import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("searchDAO")
public interface SearchDAO {
    public List<RestaurantVO> findRestaurant(String keywords) throws DataAccessException;
}
