package xxk.train.dao.impl;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import xxk.train.dao.BookDao;
import xxk.train.dao.OrderDao;
import xxk.train.entity.Order;
import xxk.train.entity.Storein;
import xxk.train.entity.Storeout;
import xxk.train.entity.User;
import xxk.train.util.DruidUtil;

public class OrderDaoImpl implements OrderDao {
	private BookDao bookDao = new BookDaoImpl();

	@Override
	public int insert(Order order) throws Exception {
		/*添加*/
	Connection con = DruidUtil.getConn();
		String sql1 = "select unitPrice,clicks,num from book where bookId = "+order.getBookId();
		double money=0;
		int clicks = 0;
		int num = 0;
		PreparedStatement pstmt = con.prepareStatement(sql1);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			money = rs.getDouble("unitPrice");
			clicks = rs.getInt("clicks");
			num = rs.getInt("num");
		}
		clicks =clicks +1;
		num = num-order.getOrderNum();
		String sql1_1 = "update book set num="+num+",clicks="+clicks+" where  bookId ="+order.getBookId();
		pstmt = con.prepareStatement(sql1_1);
		pstmt.executeUpdate();
		
		//进行入库表添加。。。。。。。
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		User user = userDaoImpl.getOne(order.getUserId());
		StoreoutDaoImpl storeoutDaoImpl = new StoreoutDaoImpl();
		Storeout storeout = new Storeout();
		storeout.setBookId(order.getBookId());
		storeout.setUserName(user.getUserName());
		storeout.setStoreoutNum(order.getOrderNum());
		storeoutDaoImpl.insert(storeout);
		//得到订单表
		String sql2 = "insert `order`(bookId,userId,orderNum,orderName,orderAddr,transport,totalPrice) values(?,?,?,?,?,?,?) ";
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, order.getBookId());
		pstmt.setInt(2, order.getUserId());
		pstmt.setInt(3, order.getOrderNum());
		pstmt.setString(4, order.getOrderName());
		pstmt.setString(5, order.getOrderAddr());	
		pstmt.setInt(6, order.getTransport());
		pstmt.setDouble(7, order.getOrderNum()*money);
		int reslut = pstmt.executeUpdate();
		//进行仓库管理
		DruidUtil.close(rs, null, pstmt, con);
		return reslut;
	}
	@Override
	public int update(int orderId,int transport) throws Exception {
		String sql = "update `order` set transport = "+(transport+1)+"  where orderId = "+ orderId;
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}

	@Override
	public Order getOne(Integer id) throws Exception {
		String sql = "select * from `order` where orderId="+id;
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Order order = new Order();
		if(rs.next()) {
			order.setOrderId(rs.getInt("orderId"));
			order.setBookId(rs.getInt("bookId"));
			order.setUserId(rs.getInt("userId"));
			order.setOrderDate(rs.getTimestamp("orderDate"));
			order.setOrderNum(rs.getInt("orderNum"));
			order.setOrderAddr(rs.getString("orderAddr"));
			order.setOrderName(rs.getString("orderName"));
			order.setTransport(rs.getInt("transport"));
			order.setTotalPrice(rs.getDouble("totalPrice"));
		}
		DruidUtil.close(rs, null, pstmt, con);
		return order;
	}
	public int getNum(int bookId,int userId) {
		String sql = "select * from `order` where 1=1  ";
		List<Order> list = new ArrayList<Order>();
		if (bookId !=0) {
			sql = sql +" and bookId = "+bookId;	
		}if (userId!=0) {
			sql = sql + " and  userId = "+ userId;
		}
		Connection con = DruidUtil.getConn();
		int reslut = 0;
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				reslut++;	
			}
			DruidUtil.close(rs, null, pstmt, con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reslut;
		
	}

	@Override
	public List<Order> getList(int bookId,int userId,String transport, int page,int limit) throws Exception {
		String sql = "select * from `order` where 1=1  ";
		List<Order> list = new ArrayList<Order>();
		if (bookId !=0) {
			sql = sql +" and bookId = "+bookId;	
		}if (userId!=0) {
			sql = sql + " and  userId = "+ userId;
		}if (transport!=null && transport.length()>0) {
			int tspt = Integer.valueOf(transport);
			sql = sql + "  and transport = "+ transport;
		}
		sql = sql +"  LIMIT "+(page-1)*limit+","+limit;
		System.out.println(sql);
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Order order = new Order();
			order.setOrderId(rs.getInt("orderId"));
			order.setBookId(rs.getInt("bookId"));
			order.setUserId(rs.getInt("userId"));
			order.setOrderDate(rs.getTimestamp("orderDate"));
			order.setOrderNum(rs.getInt("orderNum"));
			order.setOrderAddr(rs.getString("orderAddr"));
			order.setOrderName(rs.getString("orderName"));
			order.setTransport(rs.getInt("transport"));
			order.setTotalPrice(rs.getDouble("totalPrice"));
			list.add(order);		
		}
		DruidUtil.close(rs, null, pstmt, con);
		return list;
	}
	@Override
	public int update(Order order) throws Exception {
		String sql = "update `order` set bookId=?,userId=?,orderNum=?,orderName=?,orderAddr=?,totalPrice=? where orderId = "+ order.getOrderId();
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, order.getBookId());
		pstmt.setInt(2, order.getUserId());
		pstmt.setInt(3, order.getOrderNum());
		pstmt.setString(4, order.getOrderName());
		pstmt.setString(5, order.getOrderAddr());
		Connection con1 = DruidUtil.getConn();
		String sql1 = "select unitPrice from books where bookId = "+order.getBookId();
		PreparedStatement pstmt1 = con.prepareStatement(sql1);
		ResultSet rs1 = pstmt1.executeQuery();
		if (rs1.next()) {
			pstmt.setDouble(6, rs1.getDouble("unitPrice")*order.getOrderNum());
		}
		DruidUtil.close(rs1, null, pstmt1, con1);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
	@Override
	public int delete(int orderId) throws Exception {
		System.out.println("orderId ="+orderId);
		String sql = "delete from `order` where orderId =?";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, orderId);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}

}
