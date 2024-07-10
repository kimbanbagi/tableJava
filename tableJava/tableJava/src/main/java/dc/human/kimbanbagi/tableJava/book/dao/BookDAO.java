package dc.human.kimbanbagi.tableJava.book.dao;

import dc.human.kimbanbagi.tableJava.book.vo.BookVO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("bookDAO")
public interface BookDAO {
    // 사용자
    public List<BookVO> getUserBookList(String userId) throws DataAccessException;
    public int addBook(BookVO book) throws DataAccessException;
    public int cancelBookFromUser(String userId, String restaurantId) throws DataAccessException;
    public List<BookVO> getHistory(String userId) throws DataAccessException;
    public int updateWritten(String userId, String restaurantId) throws DataAccessException;

    // 사장님
    public List<BookVO> getOwnerBookList(String restaurantId) throws DataAccessException;
    public int confirmBook(String bookId, String restaurantId) throws DataAccessException;
    public int cancelBookFromOwner(String bookId, String restaurantId) throws DataAccessException;
    public int endBook(String bookId, String restaurantId) throws DataAccessException;
}
