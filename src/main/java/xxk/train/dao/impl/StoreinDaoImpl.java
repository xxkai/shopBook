package xxk.train.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import xxk.train.dao.StoreinDao;
import xxk.train.entity.Storein;
import xxk.train.util.DruidUtil;

public class StoreinDaoImpl implements StoreinDao {

	@Override
	//入库添加，book中对应的num添加
	public int insert(Storein storein) throws Exception {
		String sql = "insert into storein(bookId,storeinNum,userName) values(?,?,?)";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, storein.getBookId());
		pstmt.setInt(2,storein.getStoreinNum());
		pstmt.setString(3, storein.getUserName());
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
//没有用
	//删除入库信息
	@Override
	public int delete(int storeinId) throws Exception {
		String sql = "DELETE FROM storein  WHERE storeinId = "+storeinId;
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
	@Override
	//根据id获得对象，可以整合
	public Storein getOne(Integer id) throws Exception {
		return null;
	}
	//得到入库表信息，得到，查询条件的数组的值
	@Override
	public int getListNum(int bookId, String userName) throws Exception {
		String sql = "select * from storein where 1=1 ";
		if (bookId !=0) {
			sql = sql +" and  bookId = "+bookId;	
		}if (userName!=null&&userName.length()>0) {
			sql = sql + " and  userName like '%"+userName+"%'  ";
		}
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int reslut = 0;
		while (rs.next()) {
			reslut++;
		}
		DruidUtil.close(rs, null, pstmt, con);
		
		return reslut;
	}
	//根据对象的到方法
	@Override
	public List<Storein> getList(int bookId, String userName, int page, int limit) throws Exception {
		String sql = "select * from storein where 1=1  ";
		List<Storein> list = new ArrayList<Storein>();
		if (bookId !=0) {
			sql = sql +" and bookId = "+bookId;	
		}if (userName!=null&&userName.length()>0) {
			sql = sql + " and  userName like '%"+userName+"%'  ";
		}
		sql = sql +"  LIMIT "+(page-1)*limit+","+limit;
		System.out.println(sql);
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Storein storein = new Storein();
			storein.setStoreinId(rs.getInt("storeinId"));
			storein.setBookId(rs.getInt("bookId"));
			storein.setStoreinNum(rs.getInt("storeinNum"));
			storein.setUserName(rs.getString("userName"));
			storein.setDateTime(rs.getTimestamp("datetime"));
			list.add(storein);
		}
		DruidUtil.close(rs, null, pstmt, con);
		return list;
	}
	@Override
	//入库表的修改，不成功
	public int update(Storein storein) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
