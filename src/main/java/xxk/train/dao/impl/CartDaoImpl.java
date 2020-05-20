package xxk.train.dao.impl;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import xxk.train.dao.CartDao;
import xxk.train.entity.Cart;
import xxk.train.util.DruidUtil;

public class CartDaoImpl implements CartDao{

	@Override
	public int insert(Cart cart) throws Exception {
		System.out.println(cart.toString());
		String sql = "insert into `cart`(userId,bookId,num) values(?,?,?)";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cart.getUserId());
		pstmt.setInt(2, cart.getBookId());
		pstmt.setInt(3, cart.getNum());
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
//购物车修改只有会修改数量；
	@Override
	public int update(Cart cart) throws Exception {
		String sql = "update `cart` set num = ? where cartId =?";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cart.getNum());
		pstmt.setInt(2, cart.getCartId());
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}

	@Override
	public int delete(Cart cart) throws Exception {
		String sql = " delete from `cart` where cartId =?";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		System.out.println("cart = "+cart.getCartId());
		pstmt.setInt(1, cart.getCartId());
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
 		return result;
	}

	@Override
	public List<Cart> getList(int userId) throws Exception {
		String sql = "select * from `cart` where userId="+userId;
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<Cart > list = new ArrayList<Cart>();
		while (rs.next()) {
			Cart cart = new  Cart();
			cart.setCartId(rs.getInt("cartId"));
			cart.setUserId(rs.getInt("userId"));
			cart.setBookId(rs.getInt("bookId"));
			cart.setNum(rs.getInt("num"));
			Connection con1 = DruidUtil.getConn();
			Map<String, Object> map = new HashMap<String, Object>();
			String sql1 = "SELECT title,image,unitPrice FROM cart,books WHERE cart.bookId = books.bookId AND cart.cartId = ?";
			PreparedStatement pstmt1 = con.prepareStatement(sql1);
			pstmt1.setInt(1, cart.getCartId());
			ResultSet rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				map.put("title", rs1.getString("title"));
				map.put("image", rs1.getString("image"));
				map.put("unitPrice", rs1.getDouble("unitPrice"));
			}
			DruidUtil.close(rs1, null, pstmt1, con1);
			cart.setDataMap(map);
			list.add(cart);
		}
		DruidUtil.close(rs, null, pstmt, con);
		return list;
	}
	

}
