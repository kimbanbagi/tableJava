package dc.human.kimbanbagi.tableJava.restaurant.dao;

import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("restaurantDAO")
public interface RestaurantDAO {
    public RestaurantVO getResInfo(String userId) throws DataAccessException;
    public int addRestaurant(RestaurantVO restaurantVO) throws DataAccessException;
    public int updateRegister(String userId) throws DataAccessException;
    public RestaurantVO getRestaurantDetail(String restaurantId) throws DataAccessException;
}
