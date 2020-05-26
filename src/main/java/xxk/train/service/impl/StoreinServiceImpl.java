package xxk.train.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import xxk.train.dao.StoreinDao;
import xxk.train.dao.impl.StoreinDaoImpl;
import xxk.train.entity.Storein;
import xxk.train.service.StoreinService;
import xxk.train.util.DruidUtil;

public class StoreinServiceImpl implements StoreinService {
	StoreinDao storeinDao = new StoreinDaoImpl();
	@Override
	public int insert(Storein storein) throws Exception {
		int bookId = storein.getBookId();
		int storeinNum = storein.getStoreinNum();
		if (bookId!=0) {
			String sql = "update book set num= ? where bookId=?";
			Connection con = DruidUtil.getConn();
			PreparedStatement pstmt =  con.prepareStatement(sql);
			pstmt.setInt(1, storeinNum);
			pstmt.setInt(2, bookId);
			pstmt.executeUpdate();
			DruidUtil.close(null, null, pstmt, con);
		}
		
		return storeinDao.insert(storein);
	}

	@Override
	public int update(Storein storein) throws Exception {
		// TODO Auto-generated method stub
		return storeinDao.update(storein);
	}

	@Override
	public int delete(int storeinId) throws Exception {
		// TODO Auto-generated method stub
		return storeinDao.delete(storeinId);
	}

	@Override
	public List<Storein> getList() throws Exception {
		String  sql ="select * from storein";
		List<Storein> list = new ArrayList<Storein>();
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
	public List<Storein> getList(int bookId,String userName, int page, int limit) throws Exception {
		return storeinDao.getList(bookId, userName,page, limit);
	}

	@Override
	public int getListNum(int bookId,String userName) throws Exception {
		// TODO Auto-generated method stub
		return storeinDao.getListNum(bookId,userName);
	}

}
