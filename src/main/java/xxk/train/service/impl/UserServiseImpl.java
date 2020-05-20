package xxk.train.service.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.druid.sql.dialect.phoenix.ast.PhoenixUpsertStatement;

import xxk.train.dao.UserDao;
import xxk.train.dao.impl.UserDaoImpl;
import xxk.train.entity.User;
import xxk.train.service.UserService;
import xxk.train.util.DruidUtil;

public class UserServiseImpl implements UserService {
	UserDao userDao = new UserDaoImpl();
	//添加用户
	@Override
	public int insert(User user) throws Exception {
		return userDao.insert(user);
	}

	@Override
	public int update(User user) throws Exception {

		return userDao.update(user);
	}

	@Override
	public int delete(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return userDao.delete(id);
	}

	@Override
	public User getOne(Integer id) throws Exception {
		return userDao.getOne(id);
	}

	@Override
	public List<User> getList(User user,int page,int limit) throws Exception {
		
		return userDao.getList(user,page,limit);
	}
	//用于用户登录。。。。reslut：-1，0，1；-1没有对象，0会员；1管理员
	@Override
	public User login(String userName, String userPass) {
	// TODO Auto-generated method stub
		int result = -1;
		String sql = "select * from user  where userName =? and userPass=?";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		User user = new User();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,userName );
			pstmt.setString(2, userPass);
			 rs = pstmt.executeQuery();			
			if (rs.next()) {
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setUserPass(rs.getString("userPass"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setNoAdmin(rs.getInt("noAdmin"));
				user.setFrist_time(rs.getTimestamp("frist_time"));
				user.setLast_time(rs.getTimestamp("last_time"));	
				System.out.println(result);
			}else {
				System.out.println(result);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DruidUtil.close(rs, null, pstmt, con);
		}
		return user;
	}
//更具id 修改  noDel中的值
	@Override
	public int deleteNO(String Name,int noDel) throws Exception {
		String sql = "UPDATE user SET noDel = ? WHERE userName = ?  ";
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, noDel);
		pstmt.setString(2, Name);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
	@Override
	public int updatePass(String userName,String userPass) {
		String sql = "update user set userPass ='"+userPass +"' where userName ='"+userName+"'";
		System.out.println("sql"+sql);
		Connection con = DruidUtil.getConn();
		int reslut = 0;
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			reslut = pstmt.executeUpdate();
			DruidUtil.close(null, null, pstmt, con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reslut; 
		
	}
	/*@Override
	public int getNum(Map<String, String> map) {
		List<User> list = new ArrayList<User>();
		String sql = "select * from user where 1 = 1 ";
		sql = sql + UserDaoImpl.getCondition(map).toString();
		Connection con = DruidUtil.getConn();
		int i=0;
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				i++;
			}
			DruidUtil.close(null, null, pstmt, con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}*/
	public int judgeName (String userName) {
		Connection con = DruidUtil.getConn();
		String sql = "select * from user where userName=?";
		int result = 0 ;
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1 ;
			}
			DruidUtil.close(rs, null, pstmt, con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
}
