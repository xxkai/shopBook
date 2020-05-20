package xxk.train.service;

import java.util.List;
import java.util.Map;

import xxk.train.entity.User;

public interface UserService {
	public User login(String userName,String userPass);	
	public int insert(User user) throws Exception;	
	public int update(User user) throws Exception;
	public int deleteNO(String userName,int noDel) throws Exception;//点击删除，用户属性删除	
	public int delete(Integer id) throws Exception;	
	public User getOne(Integer id) throws Exception;
	public List<User> getList(User user,int page,int limit) throws Exception;
	/*public int getNum(Map<String, String> Map)throws Exception;	*/
	public int judgeName(String userName)throws Exception;
	int updatePass(String userName, String userPass)throws Exception;
	

}
