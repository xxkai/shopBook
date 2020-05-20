package xxk.train.service.impl;

import java.util.List;

import xxk.train.dao.BookDao;
import xxk.train.dao.impl.BooksDaoImpl;
import xxk.train.entity.Book;
import xxk.train.service.BooksService;

public class BooksServiceImpl implements BooksService {
	private BookDao booksDao= new BooksDaoImpl();
	@Override
	public int update(Book books) throws Exception {
		
		return booksDao.update(books);
	}
	@Override
	public int delete(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return booksDao.delete(id);
	}
	@Override
	public Book getOne(Integer id) throws Exception {
		Book book = booksDao.getOne(id);
		return book;
	}
	@Override
	public int insert(Book books) throws Exception {
		// TODO Auto-generated method stub
		return booksDao.insert(books);
	}

	@Override
	public List<Book> booksList(Book books, int page, int limit) throws Exception {
		// TODO Auto-generated method stub
		return booksDao.booksList(books, page,limit);
	}

	@Override
	public int booksNum(Book books) throws Exception {
		// TODO Auto-generated method stub
		return booksDao.booksNum(books);
	}
	@Override
	public List<Book> booksOneList(int categoryId) throws Exception {
		// TODO Auto-generated method stub
		return booksDao.booksOneList(categoryId);
	}

}
