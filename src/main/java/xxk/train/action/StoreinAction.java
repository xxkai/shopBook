package xxk.train.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.action.DispatcherAction;
import xxk.train.entity.Storein;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.StoreinService;
import xxk.train.service.impl.StoreinServiceImpl;

/**
 * Servlet implementation class StoreinAction
 */
public class StoreinAction extends DispatcherAction {
	private static final long serialVersionUID = 1L;
    StoreinService storeinService = new StoreinServiceImpl();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreinAction() {
        super();
    }
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getList(request,response);
	}

		public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 	   request.setCharacterEncoding("UTF-8");
 		response.setCharacterEncoding("UTF-8");
 		String storeinId = request.getParameter("storeinId");
 		try {
			storeinService.delete(Integer.valueOf(storeinId));
			String json = layuiJSNO.tomageJSNO(storeinId, storeinId);
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 	   request.setCharacterEncoding("UTF-8");
 		response.setCharacterEncoding("UTF-8");
 		String userName = request.getParameter("userName");
 		String bookId = request.getParameter("bookId");
 		String storeinNum = request.getParameter("storeinNum");
 		Storein storein = new Storein();
 		storein.setUserName(userName);
 		storein.setBookId(Integer.valueOf(bookId));
 		storein.setStoreinNum(Integer.valueOf(storeinNum));
 		try {
			int reslut = storeinService.insert(storein);
			String json = layuiJSNO.tomageJSNO("reslut", "yes");
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
   public void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		String limit= request.getParameter("limit"); 
		String bookId = request.getParameter("bookId");
		String userName = request.getParameter("userName");
		bookId = bookId!=null&&bookId.length()>0?bookId:"0";
		try {
			List<Storein> list = storeinService.getList(Integer.valueOf(bookId),userName, Integer.valueOf(page),Integer.valueOf(limit));
			int num = storeinService.getListNum(Integer.valueOf(bookId),userName);
			String json = layuiJSNO.toJSNO(num, list);
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
