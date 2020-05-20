package xxk.train.service;

import java.util.List;

import xxk.train.entity.Storeout;

public interface StoreoutService {
	public int insert(Storeout storeout) throws Exception;
	public int update(Storeout storeout) throws Exception;
	public int delete(int storeoutId) throws Exception;
	public List<Storeout> getList() throws Exception;
	public List<Storeout> getList(Storeout storeout, int page, int limit) throws Exception;	
}
