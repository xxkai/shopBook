package xxk.train.dao.impl;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xxk.train.dao.BookDao;
import xxk.train.entity.Book;
import xxk.train.util.DruidUtil;

public class BooksDaoImpl implements BookDao {
	@Override
	//增加数据并获得数据增加的数据的id值;
	public int insert(Object object) throws Exception {
		// 定义一个sql字符串
				String sql = "insert into ";
				// 得到对象的类
				Class<? extends Object> c = object.getClass();
				// 得到对象中所有的方法
				Method[] methods = c.getMethods();
				// 得到对象类的名字
				String cName = c.getName();
				// 从类的名字中解析出表名
				String tableName = cName.substring(cName.lastIndexOf(".") + 1, cName.length());
				sql += tableName + "(";
				List<String> mList = new ArrayList<String>();
				List<Object> vList = new ArrayList<Object>();
				for (Method method : methods) {
					String mName = method.getName();
					if (mName.startsWith("get") && !mName.startsWith("getClass")) {
						String fieldName = mName.substring(3, mName.length());
						if (fieldName.equals("BookId"))
							continue;
						mList.add(fieldName);
						try {
							Object value = method.invoke(object, null);// 将该方法的返回值返回给调用者
							Class<?> returnType = method.getReturnType();
							String tpye = returnType.getName();
							switch (tpye) {
							case "int":
								break;
							case "java.lang.String":
								value = "'" + value + "'";
								break;
							default:
								break;
							}
							vList.add(value);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
				for (int i = 0; i < mList.size(); i++) {
					if (i < mList.size() - 1) {
						sql += mList.get(i) + ",";
					} else {
						sql += mList.get(i) + ") values(";
					}
				}
				for (int i = 0; i < vList.size(); i++) {
					if (i < vList.size() - 1) {
						sql += vList.get(i) + ",";
					} else {
						sql += vList.get(i) + ");";
					}
				}
				Connection con = DruidUtil.getConn(); 
				PreparedStatement pstmt  = con.prepareStatement(sql);
				int result = pstmt.executeUpdate();
				DruidUtil.close(null, null, pstmt, con);
				return result;
		
	}
	@Override
	public int update(Book books) throws Exception {
		// 定义一个sql字符串
		if (books.getBookId()!=0&&books!=null) {
		//	UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
			String sql = "update books set ";
			Class<Book> c = Book.class;
			// 得到对象中所有的方法
			Method[] methods = c.getMethods();
			// 得到对象类的名字
			String cName = c.getName();
			// 从类的名字中解析出表名
			String tableName = cName.substring(cName.lastIndexOf(".") + 1, cName.length());
		//	sql += tableName + "(";
			List<String> mList = new ArrayList<String>();
			List<Object> vList = new ArrayList<Object>();
			for (Method method : methods) {
				String mName = method.getName();
				if (mName.startsWith("get") && !mName.startsWith("getClass")) {
					String fieldName = mName.substring(3, mName.length());
					if (fieldName.equals("BookId"))
						continue;
					mList.add(fieldName);
					try {
						Object value = method.invoke(books, null);// 将该方法的返回值返回给调用者
						Class<?> returnType = method.getReturnType();

						String tpye = returnType.getName();
						switch (tpye) {
						case "int":
							break;
						case "java.lang.String":
							value = "'" + value + "'";
							break;
						default:
							break;
						}
						vList.add(value);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			for (int i = 0; i < vList.size(); i++) {
				if (i < vList.size() - 1) {

						sql +=mList.get(i)+"="+ vList.get(i) + ",";
				} else {
					sql +=mList.get(i)+"="+vList.get(i) + "where bookId = "+books.getBookId();
				}
			}
			int result = 0;
			 try {
				 Connection con = DruidUtil.getConn();
				PreparedStatement pstmt= con.prepareStatement(sql);
				result = pstmt.executeUpdate();
				DruidUtil.close(null, null, pstmt, con);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return result;
		}
		// 得到对象的类
		return 0;
	}

	@Override
	public int delete(Integer id) throws Exception {
		String sql = "delete from books where bookId="+id;
		int result = 0 ;
		try {
			Connection con = DruidUtil.getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			result = pstmt.executeUpdate();
			DruidUtil.close(null, null, pstmt, con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public Book getOne(Integer id) throws Exception {
		Book books  = new Book();
		String sql = "select * from books where bookId ="+id;
		Connection con= DruidUtil.getConn(); 
		PreparedStatement pstmt	= con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			books.setBookId(rs.getInt("bookId"));
			books.setTitle(rs.getString("title"));
			books.setAuthor(rs.getString("author"));
			books.setPublisherId(rs.getInt("publisherId"));
			books.setPublisherDate(rs.getString("publisherDate"));
			books.setWordsCount(rs.getInt("wordsCount"));
			books.setUnitPrice(rs.getDouble("unitPrice"));
			books.setContentDescription(rs.getString("contentDescription"));
			books.setAuthorDescription(rs.getString("authorDescription"));
			books.setCategoryId(rs.getInt("categoryId"));
			books.setClicks(rs.getInt("clicks"));
			books.setNum(rs.getInt("num"));
		}
		DruidUtil.close(rs, null, pstmt, con);
		return books;
	}
	private static StringBuilder getCon(Book books) {
		StringBuilder sql = new StringBuilder("");
		if (books.getTitle()!=null&&books.getTitle().length()>0) {
			sql.append(" and title like '%").append(books.getTitle()).append("%'");
		}
		if (books.getAuthor()!=null&&books.getAuthor().length()>0) {
			sql.append(" and author like '%").append(books.getAuthor()).append("%'");
		}
		if (books.getPublisherId()!=0) {
			sql.append(" and publisherId =").append(books.getPublisherId());
		}
		if (books.getCategoryId()!=0) {
			sql.append(" and categoryId = ").append(books.getCategoryId());

		}
		return sql;
	}

	@Override
	public List<Book> booksList(Book books, int page, int limit) throws Exception {
		List<Book> list = new ArrayList<Book>();
		Connection con =DruidUtil.getConn();
		String sql = "select * from books where 1 = 1 ";
		sql = sql +BooksDaoImpl.getCon(books);
		if (page !=0 &&limit !=0) {
			sql = sql +"	LIMIT "+(page-1)*limit+","+limit;
		}
		System.out.println(sql);
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		while(rs.next()){
			Book book = new Book();
			book.setBookId(rs.getInt("bookId"));
			book.setTitle(rs.getString("title"));
			book.setAuthor(rs.getString("author"));
			book.setPublisherId(rs.getInt("publisherId"));
			book.setPublisherDate(rs.getString("publisherDate"));
			book.setWordsCount(rs.getInt("wordsCount"));
			book.setUnitPrice(rs.getDouble("unitPrice"));
			book.setContentDescription(rs.getString("contentDescription"));
			book.setAuthorDescription(rs.getString("authorDescription"));
			book.setCategoryId(rs.getInt("categoryId"));
			book.setClicks(rs.getInt("clicks"));
			book.setNum(rs.getInt("num"));
			book.setImage(rs.getString("image"));
			list.add(book);
		}
		DruidUtil.close(rs, null, pstmt, con);
		return list;
	}
	@Override
	public List<Book> booksOneList(int categoryId) throws Exception {
		Connection con =DruidUtil.getConn();
		String sql = "select * from books where categoryId ="+categoryId;
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		List<Book> booksOneList = new ArrayList<Book>();
		while(rs.next()){
			Book book = new Book();
			book.setBookId(rs.getInt("bookId"));
			book.setTitle(rs.getString("title"));
			book.setAuthor(rs.getString("author"));
			book.setPublisherId(rs.getInt("publisherId"));
			book.setPublisherDate(rs.getString("publisherDate"));
			book.setWordsCount(rs.getInt("wordsCount"));
			book.setUnitPrice(rs.getDouble("unitPrice"));
			book.setContentDescription(rs.getString("contentDescription"));
			book.setAuthorDescription(rs.getString("authorDescription"));
			book.setCategoryId(rs.getInt("categoryId"));
			book.setClicks(rs.getInt("clicks"));
			book.setNum(rs.getInt("num"));
			book.setImage(rs.getString("image"));
			booksOneList.add(book);
		}
		DruidUtil.close(rs, null, pstmt, con);
		return booksOneList;
	}
	@Override
	public int booksNum(Book books) throws Exception {
		int result = 0 ;
		Connection con =DruidUtil.getConn();
		String sql = "select * from books where 1 = 1 ";
		sql = sql +BooksDaoImpl.getCon(books);

		//System.out.println(sql);
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		while(rs.next()){
			result ++;
		}
		DruidUtil.close(rs, null, pstmt, con);
		return result;
	}

}
