package xxk.train.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import xxk.train.dao.StoreoutDao;
import xxk.train.dao.impl.StoreoutDaoImpl;
import xxk.train.entity.Storein;
import xxk.train.entity.Storeout;
import xxk.train.service.StoreoutService;
import xxk.train.util.DruidUtil;

public class StoreoutServiceImpl implements StoreoutService {
	StoreoutDao storeoutDao = new StoreoutDaoImpl();
	@Override
	public int insert(Storeout storeout) throws Exception {
		//添加入库表的时候操作bookId表num
		//添加功能
		
		return storeoutDao.insert(storeout);
	}

	@Override
	public int update(Storeout storeout) throws Exception {
		return storeoutDao.update(storeout);
	}

	@Override
	public int delete(int storeoutId) throws Exception {
		// TODO Auto-generated method stub
		return storeoutDao.delete(storeoutId);
	}

	@Override
	public List<Storeout> getList() throws Exception {
		return null;
	}

	@Override
	public List<Storeout> getList(Storeout storeout, int page, int limit) throws Exception {
		// TODO Auto-generated method stub
		return storeoutDao.getList(storeout, page, limit);
	}

}
