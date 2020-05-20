package xxk.train.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.action.DispatcherAction;

import xxk.train.entity.Publisher;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.PublishersService;
import xxk.train.service.impl.PublishersServiceImpl;

/**
 * Servlet implementation class PublishersAction
 */
public class PublishersAction extends DispatcherAction {
	private static final long serialVersionUID = 1L;
    private PublishersService publishersService = new PublishersServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishersAction() {
        super();
    }
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	list(request,response);
	}

		public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			List<Publisher> list = publishersService.getList();
			String lists = layuiJSNO.to2JSNO(list);
			System.out.println(lists);
			PrintWriter out = response.getWriter();
			out.write(lists);
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
		try {
			List<Publisher> list = publishersService.getList();
			String json =layuiJSNO.toJSNO(12, list);
			System.out.println(json);
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public  void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String publisherName= request.getParameter("publisherName");
		System.out.println(publisherName);
		try {
			 publishersService.insert(publisherName);
			 String result = layuiJSNO.tomageJSNO("result","yes");
			PrintWriter out = response.getWriter();
			out.write(result);
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public  void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String publisherId = request.getParameter("publisherId");
		System.out.println(publisherId);
		try {
			publishersService.delete(Integer.valueOf(publisherId));
			 String result = layuiJSNO.tomageJSNO("result","yes");
			 System.out.println(result);
				PrintWriter out = response.getWriter();
				out.write(result);
				out.flush();
				out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		


}
