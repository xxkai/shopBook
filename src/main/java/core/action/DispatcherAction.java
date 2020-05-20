package core.action;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import xxk.train.entity.User;

/**
 * 派发父类 ===》核心派发类
 * 总控制器
 */
public abstract class DispatcherAction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(DispatcherAction.class.getName());  
       

    public DispatcherAction() {
        super();
    }


    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodName = request.getParameter("method");
		if(StringUtils.isAllBlank(methodName)) {
			methodName = "execute";
		}
		logger.info("=================>method = " + methodName);
		
		Class<?> clazz = this.getClass();
		
		try {
			//获取method=xxx 对应的方法
			Method method = clazz.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			
			//执行method	
			method.invoke(this, request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
