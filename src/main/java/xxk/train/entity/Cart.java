package xxk.train.entity;

import core.entity.CoreEntity;

//购物车
public class Cart extends CoreEntity{
	private int cartId;
	
	private int userId;//用户id
	private int BookId;//图书id
	private int num;//数量
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBookId() {
		return BookId;
	}
	public void setBookId(int bookId) {
		BookId = bookId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", userId=" + userId + ", BookId=" + BookId + ", num=" + num + "]";
	}
	
	
}
