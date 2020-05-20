package xxk.train.dao;
import java.util.List;
import xxk.train.entity.Category;
//类型表
public interface CategoryDao {
	public List<Category> getList() throws Exception;
}
