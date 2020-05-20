package xxk.train.service.impl;

import java.util.List;

import xxk.train.dao.OrderDao;
import xxk.train.dao.impl.OrderDaoImpl;
import xxk.train.entity.Order;
import xxk.train.service.OrderService;

public class OrderServiceImpl implements OrderService {
	OrderDao oracle = new OrderDaoImpl();
	@Override
	public int insert(Order order) throws Exception {
		// TODO Auto-generated method stub
		return oracle.insert(order);
	}

	@Override
	public int update(Order order) throws Exception {
		// TODO Auto-generated method stub
		return oracle.update(order);
	}

	@Override
	public Order getOne(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return oracle.getOne(id);
	}

	@Override
	public int getNum(int bookId, int userId) throws Exception {
		// TODO Auto-generated method stub
		return oracle.getNum(bookId, userId);
	}

	@Override
	public List<Order> getList(int bookId, int userId,String transport, int page, int limit) throws Exception {
		// TODO Auto-generated method stub
		return oracle.getList(bookId, userId,transport,  page, limit);
	}

	@Override
	public int update(int orderId,int transport) throws Exception {
		// TODO Auto-generated method stub
		return oracle.update(orderId,transport);
	}

	@Override
	public int delete(int order) throws Exception {
		// TODO Auto-generated method stub
		return oracle.delete(order);
	}

}
