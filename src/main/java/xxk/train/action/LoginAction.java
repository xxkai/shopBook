package xxk.train.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import core.action.DispatcherAction;
import core.entity.Email;
import org.apache.commons.beanutils.BeanUtils;
import xxk.train.entity.User;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.impl.UserServiseImpl;

public class LoginAction extends DispatcherAction {
	private static final long serialVersionUID = 1L;
	private UserServiseImpl userServiseImpl = new UserServiseImpl();
    public LoginAction() {
        super();
    }
    public  void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String userName = request.getParameter("userName");
		String userPass = request.getParameter("userPass");

		try {
			User user = userServiseImpl.login(userName, userPass);
			if (user.getUserId()!=0&&user.getNoAdmin() == 1) {
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else if(user.getUserId()!=0&&user.getNoAdmin()==0){
				if(user.getNoDel()!=0){
					request.setAttribute("msg", "账户已锁定，请联系管理员：13966902885");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}else {
					HttpSession session = request.getSession(true);
					session.setAttribute("user", user);//user进行存储值
					System.out.println(user);
					response.sendRedirect("../ShoppingUserAction?method=firstBooks1");
				}
			}else {
				request.setAttribute("msg", "登录失败，请重新输入账号和密码");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
//
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
    /*进行密码找回*/
	public void retrieve(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("进入密码重置后台");
		User user = new User();

		BeanUtils.populate(user, request.getParameterMap());
		System.out.println("user = " +user.toString());
		List<User> userList = userServiseImpl.getList(user,0,0);
		if (userList.size() > 0) {
			user = userList.get(0);
			String randomcode="";
			// 用字符数组的方式随机
			String model = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			char[] m = model.toCharArray();
			for (int j = 0; j < 6; j++) {
				char c = m[(int) (Math.random() * 36)];
				// 保证六位随机数之间没有重复的
				if (randomcode.contains(String.valueOf(c))) {
					j--;
					continue;
				}
				randomcode = randomcode + c;
			}
			user.setUserPass(randomcode);
			if (user.getEmail() != null && user.getEmail().length() > 0) {
				userServiseImpl.update(user);
				Email.sendMailForResetPwd(user.getEmail(), randomcode);
			}
		}
		PrintWriter out = response.getWriter();
		String json = layuiJSNO.tomageJSNO("result", "yes");
		out.write(json);
		out.flush();
		out.close();
	}
}
