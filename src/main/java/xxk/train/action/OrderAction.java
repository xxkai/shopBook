package xxk.train.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.action.DispatcherAction;
import org.apache.commons.beanutils.BeanUtils;

import xxk.train.entity.Order;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.OrderService;
import xxk.train.service.impl.OrderServiceImpl;

/**
 * Servlet implementation class OrderAction
 */
public class OrderAction extends DispatcherAction {
	private static final long serialVersionUID = 1L;
     OrderService orderService = new OrderServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAction() {
        super();
    }
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getOne(request,response);
	}

		public void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
    	String bookId = request.getParameter("bookId");
  		String userId = request.getParameter("userId");
  		String transport = request.getParameter("transport");
		String page = request.getParameter("page");
		String limit= request.getParameter("limit");
  		bookId = bookId!=null&&bookId.length()>0?bookId:"0";
  		userId = userId!=null&&userId.length()>0?userId:"0";
		try {
		  List<Order> list = orderService.getList(Integer.valueOf(bookId), Integer.valueOf(userId), transport, Integer.valueOf(page), Integer.valueOf(limit));
		  		int    num = orderService.getNum(Integer.valueOf(bookId), Integer.valueOf(userId));
		  		String json = layuiJSNO.toJSNO(num, list);
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
    public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
    	Map<String, String[]> map = request.getParameterMap();
    	Order order = new Order();
    	int reslut = 0 ;
    	try {
			BeanUtils.copyProperties(order, map);
			System.out.println(order);
			if (order.getOrderId()==0) {
				reslut = orderService.insert(order);
			}else {
				reslut =  orderService.update(order);
			}	
			PrintWriter out = response.getWriter();
			out.write(layuiJSNO.tomageJSNO("reslt", "yes"));
			out.flush();
			out.close();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
    public void getOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
    	String orderId = request.getParameter("orderId");
    //	orderId ="1";
    	try {
			Order order =orderService.getOne(Integer.valueOf(orderId));
			request.setAttribute("order", order);
			//page/table/editBooks.jsp
			request.getRequestDispatcher("page/table/editOrder.jsp").forward(request, response);
			} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
        
        
    
	public void deliver(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
  		response.setCharacterEncoding("UTF-8");
  		String orderId = request.getParameter("orderId");
  		String transport = request.getParameter("transport");
  		try {
			int result = orderService.update(Integer.valueOf(orderId),Integer.valueOf(transport));
			
			PrintWriter out = response.getWriter();
			out.write(layuiJSNO.tomageJSNO("result", "yes"));
			out.flush();
			out.close();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String orderId = request.getParameter("orderId");
		int result = orderService.delete(Integer.valueOf(orderId));
		
		PrintWriter out = response.getWriter();
		out.write(layuiJSNO.tomageJSNO("result", "yes"));
		out.flush();
		out.close();
	
	
	}
	

}
