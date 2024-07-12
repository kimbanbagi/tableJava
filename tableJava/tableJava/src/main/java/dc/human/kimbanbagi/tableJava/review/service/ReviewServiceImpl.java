package dc.human.kimbanbagi.tableJava.review.service;

import dc.human.kimbanbagi.tableJava.book.vo.BookVO;
import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;
import dc.human.kimbanbagi.tableJava.review.dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDAO reviewDAO;

    java.util.Date now = new java.util.Date();
    Date sqlDate = new Date(now.getTime());

    @Override
    public int addReview(String userId, String restaurantId, String review, String star){

        return reviewDAO.addReview(userId, restaurantId, review ,star);
    }

    @Override
    public int reviewInit(BookVO book){
        book.setCreatedDate(sqlDate);
        return reviewDAO.reviewInit(book);
    }

    @Override
    public List<ReviewVO> getReviewList(String restaurantId){
        return reviewDAO.getReviewList(restaurantId);
    }

    @Override
    public ReviewVO randomReview(String restaurantId){
        return reviewDAO.randomReview(restaurantId);
    }

}
