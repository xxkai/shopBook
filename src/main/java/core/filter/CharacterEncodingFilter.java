package core.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	private boolean ignore; //过滤器开关  true：开启    false ： 禁用
	private String charset; //设置字符集
    public CharacterEncodingFilter() {

    }
    //初始化
	public void init(FilterConfig config) throws ServletException {
		this.ignore = Boolean.valueOf(config.getInitParameter("ignore"));
		this.charset = config.getInitParameter("charset");
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		//ignore = true and charset 有值
		if(this.ignore && null != this.charset) {
			//requset 设置字符编码
			request.setCharacterEncoding(this.charset);
			//response 设置字符编码
			response.setCharacterEncoding(this.charset);
			response.setContentType("text/html; charset=" + this.charset);
		}		
		chain.doFilter(request, response);
	}
	//销毁
	public void destroy() {
		this.ignore = false;
		this.charset = null;
	}

}
