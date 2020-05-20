package xxk.train.service.impl;

import java.util.List;

import xxk.train.dao.CategoryDao;
import xxk.train.dao.impl.CategorysDaoImpl;
import xxk.train.entity.Category;
import xxk.train.service.CategorysServlet;

public class CategorysServletImpl implements CategorysServlet {
	private CategoryDao categorysDao = new CategorysDaoImpl();
	@Override
	public List<Category> getList() throws Exception {
		// TODO Auto-generated method stub
		return categorysDao.getList();
	}

}
