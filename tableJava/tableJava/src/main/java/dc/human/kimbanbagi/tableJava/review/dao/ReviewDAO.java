package dc.human.kimbanbagi.tableJava.review.dao;


import dc.human.kimbanbagi.tableJava.review.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
    public int addReview(ReviewVO review) throws DataAccessException;
}
