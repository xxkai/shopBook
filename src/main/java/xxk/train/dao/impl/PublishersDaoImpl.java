package xxk.train.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import xxk.train.dao.PublisherDao;
import xxk.train.entity.Publisher;
import xxk.train.util.DruidUtil;

public class PublishersDaoImpl implements PublisherDao {
	//添加
	//获得list表单
	@Override
	public List<Publisher> getList() throws Exception {
		List<Publisher> list = new ArrayList<Publisher>();
		String sql = "select * from publishers";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Publisher publishers = new Publisher();
			publishers.setPublisherId(rs.getInt("publisherId"));
			publishers.setPublisherName(rs.getString("PublisherName"));		
			list.add(publishers);
		}
		DruidUtil.close(rs, null, pstmt, con);
 		return list;
	}

	@Override
	public int insert(String publishersName) throws Exception {
		String sql = "INSERT INTO publishers(publisherName) values(?)";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, publishersName);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
  		return result;
	}
	@Override
	public int delete(int publisherId) throws Exception {
		String sql = "delete from publishers where publisherId = "+publisherId;
		System.out.println(sql);
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}

}
