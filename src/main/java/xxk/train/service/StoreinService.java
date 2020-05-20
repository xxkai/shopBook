package xxk.train.service;

import java.util.List;

import xxk.train.entity.Storein;

public interface StoreinService {
	public int insert(Storein storein) throws Exception;
	public int update(Storein storein) throws Exception;
	public int delete(int storeinId) throws Exception;
	public List<Storein> getList() throws Exception;
	public List<Storein> getList(int bookId,String userName,int page,int limit) throws Exception;	
	public int getListNum(int bookId,String userName)throws Exception;

}
