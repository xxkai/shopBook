package xxk.train.entity;

import java.sql.Timestamp;

public class Order {
	//订单表
	private int orderId;
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", bookId=" + bookId + ", userId=" + userId + ", orderDate=" + orderDate
				+ ", orderNum=" + orderNum + ", totalPrice=" + totalPrice + ", orderName=" + orderName + ", orderAddr="
				+ orderAddr + ", transport=" + transport + "]";
	}
	private int bookId;
	private int userId;
	private Timestamp orderDate;
	private int orderNum;//图书的数量
	private double totalPrice;//订单的价格
	private String orderName;//收货人
	private String orderAddr;//送货地址
	private int transport;//是否发货
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderAddr() {
		return orderAddr;
	}
	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}
	public int getTransport() {
		return transport;
	}
	public void setTransport(int transport) {
		this.transport = transport;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
