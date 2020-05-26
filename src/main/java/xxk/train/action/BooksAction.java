package xxk.train.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.action.DispatcherAction;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import xxk.train.entity.Book;
import xxk.train.layui.layuiJSNO;
import xxk.train.service.BookService;
import xxk.train.service.impl.BooksServiceImpl;

public class BooksAction extends DispatcherAction {
	private static final long serialVersionUID = 1L;
   BookService booksService = new BooksServiceImpl();
    public BooksAction() {
        super();
    }
    /**添加 books**/
	public void execute(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		getOne(request,response);
	}

		public void insertimg(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
    	Map<String, String[]> map = request.getParameterMap();
    	System.out.println(map.keySet().toString());
    	Book books = new Book();
		try {
			BeanUtils.populate(books, map);
			System.out.println(books);
			if (books.getBookId()==0) {
				booksService.insert(books);
			}else {
				booksService.update(books);
			}		
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			System.out.println(books);



    }
    public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String fullName = "";
		String contextName = "";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if(isMultipart){
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);

			try {
				List<FileItem> items = upload.parseRequest(request);
				Map<String, String> map = new HashedMap();
				for(FileItem item : items) {
						String field = item.getFieldName();
					if(item.isFormField()){ //普通form表单控件的数据
						//String field = item.getFieldName();
						String value = item.getString("utf-8");
						System.out.println("name = "+field +",value =" + value);
						map.put(field, value);
					}else{ //上传字段
						String fileName = item.getName(); //获得传输进来的地址
						//logger.info("fileName = " + fileName);
						String RandomName = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(item.getName());//存储对象名
						if(fileName != null && fileName.length() > 0){
							String parentDir = this.getServletContext().getRealPath("/upload");//在文件之前的
							File file = new File(parentDir, RandomName);	//绝对地址
							System.out.println(file);
							fullName = file.getPath();
							//上下文文件名
							contextName = this.getServletContext().getContextPath() + "/upload/"+ RandomName;//相对地址
							map.put("image", contextName);
							System.out.println("name = "+field +",value =" + contextName);
							if(!file.getParentFile().exists()){
								file.getParentFile().mkdirs();
							}

							item.write(file);
						}

					}
				}
				//System.out.println(map.toString());
				PrintWriter out = response.getWriter();
				//contextName = contextName.length()>0 ?contextName:
				out.write(layuiJSNO.tomageJSNO("contextName", contextName));
				System.out.println( "map ===>" + map);
				} catch (Exception e) {
				e.printStackTrace();
				}
		}
	}
	public void booksList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		String limit= request.getParameter("limit"); 
		String title = request.getParameter("title");
		System.out.println(title);
		String author = request.getParameter("author");
		BookService booksService = new BooksServiceImpl();
		Book books = new Book();
		books.setTitle(title);
		books.setAuthor(author);
		try {
			int num =booksService.booksNum(books);
			List<Book> list =booksService.booksList(books,Integer.valueOf(page),Integer.valueOf(limit));
			String json = layuiJSNO.toJSNO(num, list);
			System.out.println(json);
			PrintWriter out = response.getWriter();
			out.write(json);
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	public void books(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		String author = request.getParameter("author");
		BookService booksService = new BooksServiceImpl();
		Book books = new Book();
		try {
			int num =booksService.booksNum(books);
			List<Book> list =booksService.booksList(books,1,num);
			String json = layuiJSNO.to2JSNO(list);
			//String json = layuiJSNO.toJSNO(num, list);
			System.out.println(json);
			PrintWriter out = response.getWriter();
			out.write(json);
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	public  void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId= request.getParameter("bookId");
		System.out.println(bookId);
		try {
			int result = booksService.delete(Integer.valueOf(bookId));
			PrintWriter out = response.getWriter();
			if (result == 1) {
				out.write(layuiJSNO.tomageJSNO("result", "yes"));
				//out.print(layuiJSNO.tomageJSNO(" ",""));
			}
			out.flush();
			out.close();
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void getOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId = request.getParameter("bookId");
		System.out.println(bookId);
		 try { Book books = booksService.getOne(Integer.valueOf(bookId));
		 System.out.println(books);
		 	request.setAttribute("book",books);
		 	request.getRequestDispatcher("page/table/editBooks.jsp").forward(request, response);
		 }catch (Exception e) { // TODO Auto-generated catch block
		  e.printStackTrace();
		  }
	
	}
}
