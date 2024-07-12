package dc.human.kimbanbagi.tableJava.restaurant.service;

import dc.human.kimbanbagi.tableJava.restaurant.dao.RestaurantDAO;
import dc.human.kimbanbagi.tableJava.restaurant.vo.RestaurantVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;

@Service("restaurantService")
@Transactional(propagation = Propagation.REQUIRED)
public class OwnerRestaurantServiceImpl implements OwnerRestaurantService {
    @Autowired
    private RestaurantDAO restaurantDAO;

    java.util.Date now = new java.util.Date();
    Date sqlDate = new Date(now.getTime());

    @Override
    public RestaurantVO getResInfo(String userId){
        return restaurantDAO.getResInfo(userId);
    }

    @Override
    public int addRestaurant(RestaurantVO restaurant){
        restaurant.setCreatedDate(sqlDate);
        restaurant.setRevCount("0");

        if(restaurant.getrStatus()==null || restaurant.getrStatus().isEmpty()){
            restaurant.setrStatus("F");
        }

        if(restaurant.getwStatus()==null || restaurant.getwStatus().isEmpty()){
            restaurant.setwStatus("F");
        }

        return restaurantDAO.addRestaurant(restaurant);
    }

    @Override
    public int updateRegister(String userId) {
        return restaurantDAO.updateRegister(userId);
    }
}
