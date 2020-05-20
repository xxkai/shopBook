package xxk.train.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import xxk.train.dao.CartDao;
import xxk.train.dao.impl.CartDaoImpl;
import xxk.train.entity.Cart;
import xxk.train.service.CartService;
import xxk.train.util.DruidUtil;

public class CartServiceImpl implements CartService {
	CartDao cartdao = new CartDaoImpl();
	@Override
	public int insert(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		return cartdao.insert(cart);
	}

	@Override
	public int update(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		return cartdao.update(cart);
	}

	@Override
	public int delete(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		return cartdao.delete(cart);
	}

	@Override
	public List<Cart> getList(int userId) throws Exception {
		// TODO Auto-generated method stub
		return cartdao.getList(userId);
	}

	@Override
	public Cart getOne(int cartId) throws Exception {
		String sql = "select * from cart where cartId ="+cartId;
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Cart cart = new Cart();
		if (rs.next()) {
			cart.setCartId(rs.getInt("cartId"));
			cart.setBookId(rs.getInt("bookId"));
			cart.setUserId(rs.getInt("userId"));
			cart.setNum(rs.getInt("num"));	
		}
		return cart;
	}

}
