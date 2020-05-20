package xxk.train.dao;
import java.util.List;
import xxk.train.entity.Storeout;
public interface StoreoutDao {
	public int insert(Storeout storeout) throws Exception;
	public int update(Storeout storeout) throws Exception;
	public int delete(int storeoutId) throws Exception;
	public Storeout getOne(Integer id) throws Exception;
	public List<Storeout> getList(Storeout storeout,int page,int limit) throws Exception;	

}
