package xxk.train.dao;

import java.util.List;
import java.util.Map;
import xxk.train.entity.User;
public interface UserDao {
	public int insert(User user) throws Exception;
	public int update(User user) throws Exception;
	public int delete(Integer id) throws Exception;
	public User getOne(Integer id) throws Exception;
	public List<User> getList(User user,int page,int limit) throws Exception;

}
