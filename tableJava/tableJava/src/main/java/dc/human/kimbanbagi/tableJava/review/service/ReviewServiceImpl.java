package dc.human.kimbanbagi.tableJava.review.service;

import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;
import dc.human.kimbanbagi.tableJava.review.dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDAO reviewDAO;

    @Override
    public int addReview(ReviewVO review){
        return reviewDAO.addReview(review);
    }
}
