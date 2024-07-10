package dc.human.kimbanbagi.tableJava.review.dao;


import dc.human.kimbanbagi.tableJava.book.vo.BookVO;
import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
    public int addReview(String userId, String restaurantId, String review, String star) throws DataAccessException;
    public int reviewInit(BookVO book) throws DataAccessException;
    public List<ReviewVO> getReviewList(String restaurantId) throws DataAccessException;
    public ReviewVO randomReview(String restaurantId) throws DataAccessException;
}
