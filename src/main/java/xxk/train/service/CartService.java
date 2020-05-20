package xxk.train.service;

import java.util.List;

import xxk.train.entity.Cart;

public interface CartService {
	public int insert(Cart cart) throws Exception;
	public int update(Cart cart) throws Exception;
	public int delete(Cart cart) throws Exception;
	//public User getOne(Integer id) throws Exception;
	public List<Cart> getList(int userId) throws Exception;	
	public Cart getOne(int cartId) throws  Exception;

}
