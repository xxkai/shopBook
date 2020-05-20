package xxk.train.dao;

import java.util.List;

import xxk.train.entity.Book;
import xxk.train.entity.User;
//服务层user
/**
 * @author Administrator
 * 
 *
 */
public interface BookDao {
	//public int insert(Books books) throws Exception;//根据insert查找对象
	public int update(Book books) throws Exception;//根据books对books进行修改
	public int delete(Integer id) throws Exception;//根据id删除内容
	public Book getOne(Integer id) throws Exception;//根据对象查找内容
	public List<Book> booksList(Book books, int page, int limit) throws Exception;//根据map查找kist
	public int booksNum(Book books)throws Exception;//获得查询的内容的数量
	public int insert(Object object) throws Exception;
	public List<Book> booksOneList(int categoryId) throws Exception;

}
