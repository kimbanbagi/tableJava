package dc.human.kimbanbagi.tableJava.book.service;

import dc.human.kimbanbagi.tableJava.book.vo.BookVO;

import java.util.List;

public interface UserBookService {
    public List<BookVO> getUserBookList(String userId);
    public int addBook(BookVO book);
    public int cancelBook(String userId, String restaurantId);
    public List<BookVO> getHistory(String userId);
}
