package dc.human.kimbanbagi.tableJava.review.service;

import dc.human.kimbanbagi.tableJava.book.vo.BookVO;
import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;

import java.util.List;


public interface ReviewService {
    public int addReview(String userId, String restaurantId, String review, String star);
    public int reviewInit(BookVO book);
    public List<ReviewVO> getReviewList(String restaurantId);
    public ReviewVO randomReview(String restaurantId);
}
