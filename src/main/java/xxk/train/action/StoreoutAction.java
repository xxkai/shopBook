package xxk.train.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.action.DispatcherAction;
import xxk.train.entity.Book;
import xxk.train.entity.Storeout;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.StoreoutService;
import xxk.train.service.impl.BooksServiceImpl;
import xxk.train.service.impl.StoreoutServiceImpl;

/**
 * Servlet implementation class StoreoutAction
 */
public class StoreoutAction extends DispatcherAction {
	private static final long serialVersionUID = 1L;
    private StoreoutService storeoutService = new StoreoutServiceImpl();//类型数据

    public StoreoutAction() {
        super();
    }
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	getList(request,response);
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	   String storeoutId = request.getParameter("storeoutId");
  		try {
 			storeoutService.delete(Integer.valueOf(storeoutId));
 			String json = layuiJSNO.tomageJSNO("xxk", "yes");
 			PrintWriter out = response.getWriter();
 			out.write(json);
 			out.flush();
 			out.close();
 		}catch (Exception e) {
 			e.printStackTrace();
 		}
     }
     public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		String userName = request.getParameter("userName");
  		String bookId = request.getParameter("bookId");
  		String storeoutNum = request.getParameter("storeoutNum");
  		Storeout storeout = new Storeout();
  		storeout.setUserName(userName);
  		storeout.setBookId(Integer.valueOf(bookId));
  		storeout.setStoreoutNum(Integer.valueOf(storeoutNum));
  		System.out.println(storeout);
  		BooksServiceImpl booksServiceImpl = new BooksServiceImpl();
  		try {
  			Book books = booksServiceImpl.getOne(storeout.getBookId());
  			int num = books.getNum();
  			System.out.println(num);
  			PrintWriter out = response.getWriter();
  			String json = null;
  			if (storeout.getStoreoutNum()>num) {
  				json = layuiJSNO.tomageJSNO("xxk", "no");
			}else {
				int reslut = storeoutService.insert(storeout);
				json = layuiJSNO.tomageJSNO("xxk", "yes");
			}
  			System.out.println(json);
 			out.write(json);
 			out.flush();
 			out.close();
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
     }
    public void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String page = request.getParameter("page");
 		String limit= request.getParameter("limit"); 
 		String bookId = request.getParameter("bookId");
 		String userName = request.getParameter("userName");
 		bookId = bookId!=null&&bookId.length()>0?bookId:"0";
 		Storeout storeout = new Storeout();
 		storeout.setBookId(Integer.valueOf(bookId));
 		storeout.setUserName(userName);
 		try {
 			List<Storeout> list = storeoutService.getList(storeout, Integer.valueOf(page),Integer.valueOf(limit));
 			//int num = storeinService.getListNum(Integer.valueOf(bookId),userName);
 			int num = storeoutService.getList(storeout,0,0).size();
 			String json = layuiJSNO.toJSNO(num, list);
 			PrintWriter out = response.getWriter();
 			out.write(json);
 			out.flush();
 			out.close();
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		
 	}

}
