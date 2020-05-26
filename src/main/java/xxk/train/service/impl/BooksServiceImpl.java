package xxk.train.service.impl;

import java.util.List;

import xxk.train.dao.BookDao;
import xxk.train.dao.impl.BookDaoImpl;
import xxk.train.entity.Book;
import xxk.train.service.BookService;

public class BooksServiceImpl implements BookService {
	private  BookDao bookDao= new BookDaoImpl();
	@Override
	public int update(Book books) throws Exception {
		return bookDao.update(books);
	}
	@Override
	public int delete(Integer id) throws Exception {
		return bookDao.delete(id);
	}
	@Override
	public Book getOne(Integer id) throws Exception {
		Book book = bookDao.getOne(id);
		return book;
	}
	@Override
	public int insert(Book books) throws Exception {
		return bookDao.insert(books);
	}

	@Override
	public List<Book> booksList(Book book, int page, int limit) throws Exception {
		return  bookDao.getList(book,page,limit);
	}

	@Override
	public int booksNum(Book book) throws Exception {
		return bookDao.getList(book,0,0).size();
	}
	@Override
	public List<Book> booksOneList(int categoryId) throws Exception {
		Book book = new Book();
		book.setCategoryId(categoryId);
		List<Book> categoryBook = bookDao.getList(book,0,0);
		return categoryBook;
	}

}
