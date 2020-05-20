package xxk.train.service;

import java.util.List;

import xxk.train.entity.Order;

public interface OrderService {
	public int insert(Order order) throws Exception;//添加订单
	public int update(Order order) throws Exception;//修改订单
	public Order getOne(Integer id) throws Exception;//根据id获得订单
	public int getNum(int bookId,int userId)throws Exception;//数量
	public List<Order> getList(int bookId,int userId,String transport,int page,int limit) throws Exception;	
	public int update(int orderId,int transport) throws Exception;
	public int delete(int order)throws Exception;
}
