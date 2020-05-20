package xxk.train.service;

import java.util.List;

import xxk.train.entity.Book;
/**
 * @author Administrator
 * books用户服务特有功能：
 * 		1.图书销售:关于图书销售时会场生图书销售的情形，图书的数量会减去销售的数量
 * 		2.图书入库，当图书入库时，会根据图书图书的id和数量，对读书的内容进行添加
 * 		3.
 * 		
 *
 */
public interface BooksService {
	public int insert(Book books)throws Exception;//图书的添加
	public int update(Book books) throws Exception;//根据books对books进行修改
	public int delete(Integer id) throws Exception;//根据id删除内容
	public Book getOne(Integer id) throws Exception;//根据对象查找内容
	public List<Book> booksList(Book books, int page, int limit) throws Exception;//根据map查找kist
	public int booksNum(Book books)throws Exception;//获得查询的内容的数量
	public List<Book> booksOneList(int categoryId) throws Exception;
	

}
