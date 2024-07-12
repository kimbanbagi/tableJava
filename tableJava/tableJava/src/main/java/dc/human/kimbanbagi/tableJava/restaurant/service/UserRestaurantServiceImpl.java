package dc.human.kimbanbagi.tableJava.restaurant.service;

import dc.human.kimbanbagi.tableJava.restaurant.dao.RestaurantDAO;
import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;
import dc.human.kimbanbagi.tableJava.restaurant.dao.SearchDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userRestaurantService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserRestaurantServiceImpl implements UserRestaurantService {
    @Autowired
    private SearchDAO searchDAO;

    @Autowired
    private RestaurantDAO restaurantDAO;


    @Override
    public List<RestaurantVO> findRestaurant(String keywords) {
        return searchDAO.findRestaurant(keywords);
    }

    @Override
    public RestaurantVO getRestaurantDetail(String restaurantId){
        return restaurantDAO.getRestaurantDetail(restaurantId);
    }

    @Override
    public int addRevCount(String restaurantId){
        return restaurantDAO.addRevCount(restaurantId);
    }

    @Override
    public List<RestaurantVO> recommendList(){
        return restaurantDAO.recommendList();
    }

    @Override
    public RestaurantVO randomRestaurant(){
        return restaurantDAO.randomRestaurant();
    }

}
