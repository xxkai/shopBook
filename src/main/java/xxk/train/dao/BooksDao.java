package xxk.train.dao;
import xxk.train.entity.Book;
import java.util.List;
public interface BooksDao {
    public int insert(Book book) throws Exception;
    public int update(Book book) throws Exception;
    public int delete(Integer id) throws Exception;
    public Book getOne(Integer id) throws Exception;
    public List<Book> getList(Book book, int page, int limit) throws Exception;
}
