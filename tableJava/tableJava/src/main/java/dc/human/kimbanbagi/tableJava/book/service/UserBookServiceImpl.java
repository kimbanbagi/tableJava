package dc.human.kimbanbagi.tableJava.book.service;

import dc.human.kimbanbagi.tableJava.book.dao.BookDAO;
import dc.human.kimbanbagi.tableJava.book.vo.BookVO;

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

    java.util.Date now = new java.util.Date();
    Date sqlDate = new Date(now.getTime());

    @Override
    public List<BookVO> getUserBookList(String userId){
        return bookDAO.getUserBookList(userId);
    }

    @Override
    public int addBook(BookVO book){
        book.setCreatedDate(sqlDate);

        return bookDAO.addBook(book);
    }

    @Override
    public int cancelBook(String userId, String restaurantId) {
        return bookDAO.cancelBookFromUser(userId, restaurantId);
    }

    @Override
    public List<BookVO> getHistory(String userId) {
        return bookDAO.getHistory(userId);
    }
}
