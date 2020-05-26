package xxk.train.dao.impl;

import xxk.train.dao.BookDao;
import xxk.train.entity.Book;
import xxk.train.util.DruidUtil;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDaoImpl implements BookDao {
    @Override
    public int insert(Book book) throws Exception {
        String sql = "insert into ";
        // 得到对象的类
        Class<? extends Object> c = book.getClass();
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
                    Object value = method.invoke(book, null);// 将该方法的返回值返回给调用者
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
        System.out.println(sql);
        Connection con = DruidUtil.getConn();
        PreparedStatement pstmt  = con.prepareStatement(sql);
        int result = pstmt.executeUpdate();
        DruidUtil.close(null, null, pstmt, con);
        return result;
    }
    @Override
    public int update(Book book) throws Exception {
        // 定义一个sql字符串
        if (book.getBookId()!=0&&book!=null) {
            //	UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
            String sql = "update book set ";
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
                    if (fieldName.equals("BookId")) continue;
                    mList.add(fieldName);
                    try {
                        Object value = method.invoke(book, null);// 将该方法的返回值返回给调用者
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
                    sql +=mList.get(i)+"="+vList.get(i) + "where bookId = "+book.getBookId();
                }
            }
            int result = 0;
            try {
                System.out.println(sql);
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
        String sql = "delete from book where bookId="+id;
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
        Book book = new Book();
        book.setBookId(id);
        List<Book> books =getList(book,0,0);
        book = books.get(0);
        return book;
    }
    @Override
    public List<Book> getList(Book book, int page, int limit) throws Exception {
        List<Book> list = new ArrayList<Book>();
        Connection con =DruidUtil.getConn();
        String sql = "select * from book where 1 = 1 ";
        sql = sql +BookDaoImpl.getCon(book);
        if (page !=0 &&limit !=0) {
            sql = sql +"	LIMIT "+(page-1)*limit+","+limit;
        }
        System.out.println(sql);
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery(sql);
        while(rs.next()){
            book = new Book();
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
    private static StringBuilder getCon(Book books) {
        StringBuilder sql = new StringBuilder("");
        if (books.getBookId()!=0){
            sql.append(" and bookId = ").append(books.getBookId());
        }else {
            if (books.getTitle() != null && books.getTitle().length() > 0) {
                 sql.append(" and title like '%").append(books.getTitle()).append("%'");
            }
            if (books.getAuthor() != null && books.getAuthor().length() > 0) {
                sql.append(" and author like '%").append(books.getAuthor()).append("%'");
            }
            if (books.getPublisherId() != 0) {
                sql.append(" and publisherId =").append(books.getPublisherId());
            }
            if (books.getCategoryId() != 0) {
                sql.append(" and categoryId = ").append(books.getCategoryId());

            }
        }
        return sql;
    }
}
