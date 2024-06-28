package dc.human.kimbanbagi.tableJava.restaurant.service;

import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;

public interface OwnerRestaurantService {
    public RestaurantVO getResInfo(String userId) throws Exception;
    public int addRestaurant(RestaurantVO restaurantVO) throws Exception;
    public int updateRegister(String userId) throws Exception;
}
