package xxk.train.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.action.DispatcherAction;
import xxk.train.entity.Cart;
import xxk.train.entity.Category;
import xxk.train.entity.Order;
import xxk.train.entity.User;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.CartService;
import xxk.train.service.CategorysServlet;
import xxk.train.service.OrderService;
import xxk.train.service.impl.CartServiceImpl;
import xxk.train.service.impl.CategorysServletImpl;
import xxk.train.service.impl.OrderServiceImpl;

public class CartAction extends DispatcherAction {
	CartService cartService = new CartServiceImpl();
	private static final long serialVersionUID = 1L;
    public CartAction() {
        super();
    }
    //查看购物车
	public  void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		getCartList(request,response);
	}

		public  void getCartList(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	CartService cartService = new CartServiceImpl();
    	CategorysServlet categorysServlet = new CategorysServletImpl();
		try {
			List<Category> categoryList =categorysServlet.getList();
			User user =(User) request.getSession().getAttribute("user");
			int userId = user.getUserId();
			List<Cart> cartsList = cartService.getList(userId);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("cartsList", cartsList);
			request.getRequestDispatcher("bookShop/cartList.jsp").forward(request, response);
			//List<Categorys> categoryList = categorysServlet.getList();
			//request.getRequestDispatcher("bookShop/index.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    
    }
    public void insertCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	User user =(User) request.getSession().getAttribute("user");
		int userId = user.getUserId();
		System.out.println(userId);
		String bookId = request.getParameter("bookId");
		String num = request.getParameter("num");
		System.out.println("userId = "+ userId+",bookId = " + bookId +",num = "+num);
		 Cart cart = new Cart();
		 cart.setUserId(userId);
		 cart.setBookId(Integer.valueOf(bookId));
		 cart.setNum(Integer.valueOf(Integer.valueOf(num))); 
		 cartService.insert(cart); 
		 PrintWriter out =response.getWriter();
		 out.write(layuiJSNO.tomageJSNO("reslut", "1"));
		 out.flush();
		 out.close();
	}
    public void updateNum(HttpServletRequest request, HttpServletResponse response) throws Exception {
			User user =(User) request.getSession().getAttribute("user");
			int userId = user.getUserId();
			String index = request.getParameter("index");
			String count = request.getParameter("count");
			System.out.println("index ="+index+",count ="+count);
			List<Cart> cartsList = cartService.getList(userId);
			Cart cart =cartsList.get(Integer.valueOf(index));
			Double money = (Double) cart.getDataMap().get("unitPrice")*Integer.valueOf(count);
			cart.setNum(Integer.valueOf(count));
			cartService.update(cart);
			response.getWriter().print(money);
			response.getWriter().flush();
			response.getWriter().close();
    }
    public void deleteCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
			User user =(User) request.getSession().getAttribute("user");
			int userId = user.getUserId();
			String index = request.getParameter("index");
			System.out.println(index);
			List<Cart> cartsList = cartService.getList(userId);
			Cart cart =cartsList.get(Integer.valueOf(index));
			cartService.delete(cart);
			PrintWriter out = response.getWriter();
			out.write("yes");
			out.flush();
			out.close();
    	
    }
   // closeTotal
    public void closeTotal(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	User user =(User) request.getSession().getAttribute("user");
		int userId = user.getUserId();
    	String index = request.getParameter("index");
    	String total = request.getParameter("total");
    	String tep = request.getParameter("tep");
    	List<Cart> cartsList = cartService.getList(userId);		
		Double total1 =0.0;
		if (index!=null&&index.length()>0) {
			Cart cart =cartsList.get(Integer.valueOf(index));
			if ("1".equals(tep)) {
				total1 = Double.valueOf(total)+(Double)cart.getDataMap().get("unitPrice")*cart.getNum();
				
			}else {
				total1 = Double.valueOf(total)-(Double)cart.getDataMap().get("unitPrice")*cart.getNum();
			}
		}else {
			if ("1".equals(tep)) {
				for (Cart cart2 : cartsList) {
					total1 =total1+ (Double)cart2.getDataMap().get("unitPrice")*cart2.getNum();
						
				}
			}else {
					total1=0.0;
			}	
		}
		
		response.getWriter().print(total1);
		response.getWriter().flush();
		response.getWriter().close();
    }
    //payCart
    public void payCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String arr = request.getParameter("arr");
    	String total =request.getParameter("total");
    	System.out.println("arr = "+ arr +"===total =" +total);
    	request.setAttribute("arr", arr);
    	request.setAttribute("total", total);
    	request.getRequestDispatcher("bookShop/cartOrder.jsp").forward(request, response);
    }
    //cartOrder
    public void cartOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	OrderService orderService = new OrderServiceImpl();
    	User user =(User) request.getSession().getAttribute("user");
		int userId = user.getUserId();
    	String arr = request.getParameter("arr");
    	String orderName = request.getParameter("orderName");
    	String orderAddr = request.getParameter("orderAddr");
    	String[] arrList = arr.split(",");
    	List<Cart> cartsList = cartService.getList(userId);
    	//System.out.println(arrList.length);
    	for (int i = 0; i < arrList.length; i++) {
    		if (arrList[i].length()>0) {
    			Cart cart = cartService.getOne(Integer.valueOf(arrList[i]));
    			//Cart cart = cartsList.get(Integer.valueOf(arrList[i]));
    			Order order = new Order();
    			order.setBookId(cart.getBookId());
    			order.setUserId(cart.getUserId());
    			order.setOrderNum(cart.getNum());
    			order.setOrderAddr(orderAddr);
    			order.setOrderName(orderName);
    			orderService.insert(order);
    			cartService.delete(cart);
			}
    		PrintWriter out = response.getWriter();
    		out.write(layuiJSNO.tomageJSNO("result","yes"));
    		out.flush();
    		out.close();
    	
		}
    	
    }
    	     
        
}
