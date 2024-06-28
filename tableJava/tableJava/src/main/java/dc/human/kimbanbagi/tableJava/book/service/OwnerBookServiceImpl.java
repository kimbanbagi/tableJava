package dc.human.kimbanbagi.tableJava.book.service;

import dc.human.kimbanbagi.tableJava.book.dao.BookDAO;
import dc.human.kimbanbagi.tableJava.book.vo.BookVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("ownerBookService")
@Transactional(propagation = Propagation.REQUIRED)
public class OwnerBookServiceImpl implements OwnerBookService {
    @Autowired
    private BookDAO bookDAO;

    @Override
    public List<BookVO> getOwnerBookList(String restaurantId){
        return bookDAO.getOwnerBookList(restaurantId);
    }

    @Override
    public int confirmBook (String bookId, String restaurantId) {
        return bookDAO.confirmBook(bookId, restaurantId);
    }

    @Override
    public int cancelBook (String bookId, String restaurantId) {
        return bookDAO.cancelBookFromOwner(bookId, restaurantId);
    }

    @Override
    public int endBook (String bookId, String restaurantId) {
        return bookDAO.endBook(bookId, restaurantId);
    }
}
