package dc.human.kimbanbagi.tableJava.restaurant.service;

import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;

import java.util.List;

public interface UserRestaurantService {
    public List<RestaurantVO> findRestaurant(String keywords);
    public RestaurantVO getRestaurantDetail(String restaurantId);
}
