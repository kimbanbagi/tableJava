package dc.human.kimbanbagi.tableJava.book.service;

import dc.human.kimbanbagi.tableJava.book.dao.BookDAO;
import dc.human.kimbanbagi.tableJava.book.vo.BookVO;

import dc.human.kimbanbagi.tableJava.review.dao.ReviewDAO;
import dc.human.kimbanbagi.tableJava.user.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

@Service("userBookService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserBookServiceImpl implements UserBookService {
    @Autowired
    private BookDAO bookDAO;

    @Autowired
    private ReviewDAO reviewDAO;

    java.util.Date now = new java.util.Date();
    Date sqlDate = new Date(now.getTime());

    @Override
    public List<BookVO> getUserBookList(String userId){
        return bookDAO.getUserBookList(userId);
    }

    @Override
    public int addBook(BookVO book){
        book.setCreatedDate(sqlDate);
        book.setWritten("F");

        if(bookDAO.addBook(book) == 1){
            return reviewDAO.reviewInit(book);
        }

        return 0;
    }

    @Override
    public int cancelBook(String userId, String restaurantId) {
        return bookDAO.cancelBookFromUser(userId, restaurantId);
    }

    @Override
    public List<BookVO> getHistory(String userId) {
        return bookDAO.getHistory(userId);
    }

    @Override
    public int updateWritten(String userId, String restaurantId){
        return bookDAO.updateWritten(userId, restaurantId);
    }
}
