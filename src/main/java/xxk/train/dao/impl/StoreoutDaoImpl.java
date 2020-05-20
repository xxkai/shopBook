package xxk.train.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import xxk.train.dao.StoreoutDao;
import xxk.train.entity.Storein;
import xxk.train.entity.Storeout;
import xxk.train.util.DruidUtil;

public class StoreoutDaoImpl implements StoreoutDao {

	@Override
	public int insert(Storeout storeout) throws Exception {
		String sql = "insert into storeout(bookId,userName,storeoutNum) values(?,?,?)";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, storeout.getBookId());
		pstmt.setString(2, storeout.getUserName());
		pstmt.setInt(3, storeout.getStoreoutNum());
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
//不使用
	@Override
	public int update(Storeout storeout) throws Exception {
		String sql = "update storein set bookId = ?,storeinNum = ?,userName = ? where storeinId=?";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, storeout.getBookId());
		pstmt.setInt(2, storeout.getStoreoutNum());
		pstmt.setString(3, storeout.getUserName());
		pstmt.setInt(3, storeout.getStoreoutId());
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
//删除
	@Override
	public int delete(int storeoutId) throws Exception {
		String sql = "DELETE FROM storeout  WHERE storeoutId = "+ storeoutId;
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
//的到一个根据id获得的对象
	@Override
	public Storeout getOne(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
//的到list的值
	@Override
	public List<Storeout> getList(Storeout storeout, int page, int limit) throws Exception {
		String sql = "select * from storeout where 1 =1 ";
		List<Storeout> list = new ArrayList<Storeout>();
		if (storeout.getBookId() !=0) {
			sql = sql +" and bookId = "+storeout.getBookId();	
		}
		if (storeout.getUserName()!=null&&storeout.getUserName().length()>0) {
			sql = sql +" and  userName like '%"+storeout.getUserName()+"%'  ";	
		}if (page!=0&&limit!=0) {
			sql = sql +"  LIMIT "+(page-1)*limit+","+limit;
		}
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			storeout = new Storeout();
			storeout.setStoreoutId(rs.getInt("storeoutId"));
			storeout.setBookId(rs.getInt("bookId"));
			storeout.setUserName(rs.getString("userName"));
			storeout.setStoreoutNum(rs.getInt("storeoutNum"));
			storeout.setDateTime(rs.getTimestamp("datetime"));
			list.add(storeout);
		}	
		DruidUtil.close(rs, null, pstmt, con);
		return list;
	}

}
