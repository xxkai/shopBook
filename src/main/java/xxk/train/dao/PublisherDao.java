package xxk.train.dao;

import java.util.List;

import xxk.train.entity.Publisher;


//出版社表
//出版社表：增加，删除，查询
public interface PublisherDao {
	public int insert(String publishersName) throws Exception;//添加
	public int delete(int publishersId) throws Exception;
	//public int update(Publishers publishersr) throws Exception;没有修改
	//public Publishers getOne(Integer id) throws Exception;
	public List<Publisher> getList() throws Exception;
}
