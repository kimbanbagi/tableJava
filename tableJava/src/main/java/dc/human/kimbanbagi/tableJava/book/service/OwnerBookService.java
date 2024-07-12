package dc.human.kimbanbagi.tableJava.book.service;

import dc.human.kimbanbagi.tableJava.book.vo.BookVO;

import java.util.List;

public interface OwnerBookService {
    public List<BookVO> getOwnerBookList(String restaurantId);
    public int confirmBook (String bookId, String restaurantId);
    public int cancelBook(String bookId, String restaurantId);
    public int endBook(String bookId, String restaurantId);
}
