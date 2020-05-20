package xxk.train.dao;

import java.util.List;
import java.util.Map;

import xxk.train.entity.Cart;
import xxk.train.entity.User;

public interface CartDao {
	public int insert(Cart cart) throws Exception;
	public int update(Cart cart) throws Exception;
	public int delete(Cart cart) throws Exception;
	//public User getOne(Integer id) throws Exception;
	public List<Cart> getList(int userId) throws Exception;	


}
