package xxk.train.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.action.DispatcherAction;
import xxk.train.entity.Category;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.impl.CategorysServletImpl;

/**
 * Servlet implementation class CategorsAction
 */
public class CategorsAction extends DispatcherAction {
	private static final long serialVersionUID = 1L;
	CategorysServletImpl categorysServletImpl = new CategorysServletImpl();
    public CategorsAction() {
        super();
    }
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		list(request,response);
	}

		public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			List<Category> list = categorysServletImpl.getList();
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
			List<Category> list = categorysServletImpl.getList();
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

}
