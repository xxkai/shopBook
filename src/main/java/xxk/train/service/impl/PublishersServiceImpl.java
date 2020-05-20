package xxk.train.service.impl;

import java.util.List;

import xxk.train.dao.PublisherDao;
import xxk.train.dao.impl.PublishersDaoImpl;
import xxk.train.entity.Publisher;
import xxk.train.service.PublishersService;

public class PublishersServiceImpl implements PublishersService {
//出版社
	 private PublisherDao publishersDao = new PublishersDaoImpl() ;
	@Override
	public int insert(String publishersName) throws Exception {
		return publishersDao.insert(publishersName);
	}

	@Override
	public int delete(int publishersId) throws Exception {
		// TODO Auto-generated method stub
		return publishersDao.delete(publishersId);
	}

	@Override
	public List<Publisher> getList() throws Exception {
		// TODO Auto-generated method stub
		return publishersDao.getList();
	}

}
