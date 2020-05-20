package xxk.train.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xxk.train.entity.Book;
import xxk.train.entity.Category;
import xxk.train.entity.Publisher;
import xxk.train.service.BooksService;
import xxk.train.service.CategorysServlet;
import xxk.train.service.PublishersService;
import xxk.train.service.impl.BooksServiceImpl;
import xxk.train.service.impl.CategorysServletImpl;
import xxk.train.service.impl.PublishersServiceImpl;

/**
 * Servlet implementation class GotoShopAction
 */
public class GotoShopAction extends HttpServlet {
	BooksService booksService = new BooksServiceImpl();
	PublishersService publishersService = new PublishersServiceImpl();
	private CategorysServlet categorysServlet = new CategorysServletImpl();
	
	private static final long serialVersionUID = 1L;
    public GotoShopAction() {
        super();
    }
    //跳转到购买界面
    @Override
    	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   	
    	String bookId = request.getParameter("bookId");    		
    		try {
    			request.setCharacterEncoding("UTF-8");
    			response.setCharacterEncoding("UTF-8");
    			List<Category> categoryList = categorysServlet.getList();
    			request.setAttribute("categoryList",categoryList);
				Book book = booksService.getOne(Integer.valueOf(bookId));
				List<Publisher> publishersList = publishersService.getList();
				for (Publisher publishers : publishersList) {
					if (publishers.getPublisherId() == book.getPublisherId()) {
						request.setAttribute("publisherName", publishers.getPublisherName());
					}
				}
				request.setAttribute("book", book);
				request.getRequestDispatcher("bookShop/goShop.jsp").forward(request, response);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

    	//	super.service(req, resp);
    	}
}
