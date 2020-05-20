package xxk.train.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import xxk.train.dao.CategoryDao;
import xxk.train.entity.Category;
import xxk.train.util.DruidUtil;

public class CategorysDaoImpl implements CategoryDao {
/**类型表为更改内容**/
	@Override
	public List<Category> getList() throws Exception {
		List<Category> list = new ArrayList<Category>();
		String sql = "select * from categorys";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Category categorys = new Category();
			categorys.setCategoryId(rs.getInt("categoryId"));
			categorys.setCategoryName(rs.getString("categoryName"));
			list.add(categorys);
		}
		DruidUtil.close(rs, null, pstmt, con);
 		return list;
	}

}
