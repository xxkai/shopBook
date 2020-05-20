package xxk.train.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import core.action.DispatcherAction;
import org.apache.commons.beanutils.BeanUtils;
import xxk.train.entity.User;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.UserService;
import xxk.train.service.impl.UserServiseImpl;
public class UserAction extends DispatcherAction {
	UserService userService = new UserServiseImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAction() {
        super();
        // TODO Auto-generated constructor stub
    }
    //judgeName判断名字---异步
    public  void judgeName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userName = request.getParameter("userName");
    	try {
			int result = userService.judgeName(userName);
			System.out.println(result);
			PrintWriter out = response.getWriter();
			System.out.println("这是用户验证");
			if (result ==1) {
				out.write(layuiJSNO.tomageJSNO("result", "yes"));
			}else {
				out.write(layuiJSNO.tomageJSNO("result", "no"));
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    
    }
    //用户添加
    public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Map<String, String[]> map = request.getParameterMap();
    	User user = new User();
    	try {
			BeanUtils.copyProperties(user, map);
			if (user.getUserId()==0) {
				userService.insert(user);
			}else {
				userService.update(user);
			}	
			PrintWriter out = response.getWriter();
			String json = layuiJSNO.tomageJSNO("result", "yes");
			out.write(json);
			out.flush();
			out.close();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	//修改是否锁定
	public void userDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName= request.getParameter("userName");
		String noDel = request.getParameter("noDel");
		System.out.println("userName= "+userName+",noDel = "+noDel);
		int result = 0;
		try {
			result = userService.deleteNO(userName,Integer.valueOf(noDel) );
			System.out.println(result);
			PrintWriter out = response.getWriter();
			out.write(result);
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void userList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String page = request.getParameter("page");
		String limit= request.getParameter("limit"); 
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		User user = new User();
		user.getDataMap().put("userName",userName);
		user.getDataMap().put("email",email);
		System.out.println(user.toString());
		int num =userService.getList(user,0,0).size();
		List<User> list =userService.getList(user,Integer.valueOf(page),Integer.valueOf(limit));
		String json = layuiJSNO.toJSNO(num, list);
		PrintWriter out = response.getWriter();
		out.write(json);
		out.close();

	}
	public void users(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserService userService = new UserServiseImpl();
		User user = new User();
		List<User> list =userService.getList(user ,0,0);
		String json = layuiJSNO.to2JSNO(list);
		PrintWriter out = response.getWriter();
		out.write(json);
		out.close();

	}
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		try {
			int result = userService.delete(Integer.valueOf(userId));
			PrintWriter out = response.getWriter();
			if (result == 1) {
				out.print("1");
			}
			out.flush();
			out.close();
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updatePass (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userPass = request.getParameter("again_password");
		System.out.println(userPass);
		try {
			 int reslut = userService.updatePass(userName, userPass);
			 	HttpSession session = request.getSession(false);
			 	session.invalidate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		String json = layuiJSNO.tomageJSNO("reslut", "yes");
		out.write(json);
	}
	public void getOne (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		try {
			User user = userService.getOne(Integer.valueOf(userId));
			System.out.println(user);
			request.setAttribute("user", user);
			request.getRequestDispatcher("page/table/editUser.jsp").forward(request, response);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
