package xxk.train.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import core.action.DispatcherAction;
import org.apache.commons.beanutils.BeanUtils;

import xxk.train.entity.Book;
import xxk.train.entity.Category;
import xxk.train.entity.Order;
import xxk.train.entity.User;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.BookService;
import xxk.train.service.CategorysServlet;
import xxk.train.service.OrderService;
import xxk.train.service.UserService;
import xxk.train.service.impl.BooksServiceImpl;
import xxk.train.service.impl.CategorysServletImpl;
import xxk.train.service.impl.OrderServiceImpl;
import xxk.train.service.impl.UserServiseImpl;


public class ShoppingUserAction extends DispatcherAction {
	//获取图书的对象，将图书按照类型放在map中，map(类型表，图书数组）
	private CategorysServlet categorysServlet = new CategorysServletImpl();	
	private BookService booksService = new BooksServiceImpl();
	private static final long serialVersionUID = 1L;
    public ShoppingUserAction() {
        super();
    }
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		firstBooks(request,response);
	}

		public void firstBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		try {
			User user = new User();
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user);
			List<Category> categoryList = categorysServlet.getList();
			session.setAttribute("categoryList",categoryList);
			int i = 0 ;
			for (Category categorys : categoryList) {
				i++;
				request.setAttribute("book"+i, booksService.booksOneList(categorys.getCategoryId()));
			}
			request.getRequestDispatcher("bookShop/index.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//进行登陆时所跳转的界面内容
	public void firstBooks1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookService booksService = new BooksServiceImpl();
		CategorysServlet categorysServlet = new CategorysServletImpl();	
		try {
			HttpSession session = request.getSession(true);
			List<Category> categoryList = categorysServlet.getList();
			session.setAttribute("categoryList",categoryList);
			int i = 0 ;
			for (Category categorys : categoryList) {
				i++;
				request.setAttribute("book"+i, booksService.booksOneList(categorys.getCategoryId()));
			}
			request.getRequestDispatcher("bookShop/index.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void addShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String userId = request.getParameter("userId");
		String bookId = request.getParameter("bookId");
		String num = request.getParameter("num");
		
		UserService userService = new UserServiseImpl();
		BookService booksService = new BooksServiceImpl();
		try {
			//不需要添加user类因为已经放到session中了
			List<Category> categoryList = categorysServlet.getList();
			request.setAttribute("categoryList",categoryList);
			Book books= booksService.getOne(Integer.valueOf(bookId));
			request.setAttribute("book", books);
			request.setAttribute("num",num);
			request.getRequestDispatcher("bookShop/shopAdd.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("userId = "+userId +",bookId="+bookId +",num="+num);
		
	}
	//
	public void insertOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> map = request.getParameterMap();
		Order order = new Order();
		
		try {
			List<Category> categoryList = categorysServlet.getList();
			request.setAttribute("categoryList",categoryList);
			BeanUtils.copyProperties(order, map);
			//System.out.println(order);
			OrderService orderService =new OrderServiceImpl();
			orderService.insert(order);
			PrintWriter out =response.getWriter();
			out.write(layuiJSNO.tomageJSNO("reslut", "1"));
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	public void myIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("bookShop/myIndex.jsp").forward(request, response);
	}
	public void orderUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("bookShop/orderUser.jsp").forward(request, response);
	}

	/*
		关于搜素的内容
	 */
	public void soSo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String categoryId = request.getParameter("categoryId");
		String page = request.getParameter("page");//页数
		Book book = new Book();
		book.setCategoryId(Integer.valueOf(categoryId));
		List<Category> categoryList =  categorysServlet.getList();
		Category categorys =new Category();
		for (Category category : categoryList) {
			if (category.getCategoryId()==Integer.valueOf(categoryId)) {
				categorys = category;
				request.setAttribute("category", categorys);
			}
		}
		int num = booksService.booksNum(book);//查询属性的数量
		page = page!=null&&page.length()>0 ?page:"1";
		int allPage = num/20;
		int page1 = Integer.valueOf(page)-1;
		if (page1 >=(num/20)) {
			request.setAttribute("page", allPage+1);
		}else {
			request.setAttribute("page", page);//当前页数
		}
		request.setAttribute("num", num);//该类别的数量
		request.setAttribute("allPage", allPage);
	    List<Book> bookList = 	booksService.booksList(book,page1, 20);//总共多少内容
	    request.setAttribute("bookList", bookList);
	    request.getRequestDispatcher("bookShop/Soso.jsp").forward(request, response);
	}
	public void soSo1(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//	String categoryId = request.getParameter("categoryId");
		String page = request.getParameter("page");//页数
		String title = request.getParameter("title");
		System.out.println(title);
		Book book = new Book();
		book.setTitle(title);
		request.setAttribute("title", title);
		//book.setCategoryId(Integer.valueOf(categoryId));
		List<Category> categoryList =  categorysServlet.getList();
		int num = booksService.booksNum(book);//查询属性的数量
		page = page!=null&&page.length()>0 ?page:"1";
		int allPage = num/20;
		int page1 = Integer.valueOf(page)-1;
		if (page1 >=(num/20)) {
			request.setAttribute("page", allPage+1);
		}else {
			request.setAttribute("page", page);//当前页数
		}
		request.setAttribute("num", num);//该类别的数量
		request.setAttribute("allPage", allPage);
	    List<Book> bookList = 	booksService.booksList(book,page1, 20);
	    request.setAttribute("bookList", bookList);
	    request.getRequestDispatcher("bookShop/Soso2.jsp").forward(request, response);	
	}
		
	
		
		

}
