package xxk.train.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import xxk.train.dao.UserDao;
import xxk.train.entity.User;
import xxk.train.util.DruidUtil;
public class UserDaoImpl implements UserDao {
		private static final Logger logger = Logger.getLogger(UserDaoImpl.class.getName());
		//用户添加
	public int insert(User user) throws Exception {
		String  sql ="INSERT INTO `user`(`userName`,`userPass`,`email`,`phone`,`noAdmin`) VALUES ( ?, ?, ?, ?, ?);";
		Connection con = DruidUtil.getConn();
		PreparedStatement  pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getUserPass());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getPhone());
		pstmt.setInt(5, user.getNoAdmin());
		int resut = pstmt.executeUpdate();
		logger.info(user.toString());
		DruidUtil.close(null, null, pstmt, con);
		return resut;
	}
	//关于用户的修改
	public int update(User user) throws Exception {
		//UPDATE Person SET FirstName = 'Fred' WHERE LastName = 'Wilson' 
		String  sql ="update`user` set `userName`= ?,`userPass`=?,`email`=?,`phone`=?,`noAdmin` =? where userId = ?;";
		Connection con = DruidUtil.getConn();
		PreparedStatement  pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getUserPass());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getPhone());
		pstmt.setInt(5, user.getNoAdmin());
		pstmt.setInt(6, user.getUserId());
		int resut = pstmt.executeUpdate();
		logger.info(user.toString());
		DruidUtil.close(null, null, pstmt, con);
		return resut;
	}
	@Override
	//用户删除
	public int delete(Integer id) throws Exception {
		String sql = "DELETE FROM user  WHERE userId = "+id;
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		DruidUtil.close(null, null, pstmt, con);
		return result;
	}
	@Override
	//id获得用户
	public User getOne(Integer id) throws Exception {
		List<User> list = new ArrayList<User>();
		String sql = "select * from user where userId = "+id;
		System.out.println(sql);
		Connection con= DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		User user = new User();
		if(rs.next()) {
			user.setUserId(rs.getInt("userId"));
			user.setUserName(rs.getString("userName"));
			user.setUserPass(rs.getString("userPass"));
			user.setEmail(rs.getString("email"));
			user.setPhone(rs.getString("phone"));
			user.setNoAdmin(rs.getInt("noAdmin"));
			user.setFrist_time(rs.getTimestamp("frist_time"));
			user.setLast_time(rs.getTimestamp("last_time"));
			user.setNoDel(rs.getInt("noDel"));
			list.add(user);
		}
		DruidUtil.close(rs, null, pstmt, con);
		return user;
	}
//查找内容
	public  static StringBuilder getCondition(User user) {
		StringBuilder sql = new StringBuilder("");
		if (user.getUserName()!=null){
			sql.append(" and userName =").append("'"+user.getUserName()+"'");
		}
		if (user.getEmail()!=null&&user.getEmail()!=""){
			sql.append(" and email =").append("'"+user.getEmail()+"'");
		}
		if (user.getDataMap().get("userName")!=null) {
			sql.append(" and userName like '%").append(user.getDataMap().get("userName")).append("%'");
		}
		if (user.getDataMap().get("email")!=null) {
			sql.append(" and email like '%").append(user.getDataMap().get("email")).append("%'");
		}
		return sql;
	}
	@Override
	public List<User> getList(User user,int page,int limit) throws Exception {
		String sql = "select * from user where 1 = 1 ";
		if (user!=null) sql = sql + getCondition(user).toString();
		if (page!=0&&page!=0) sql = sql +"	LIMIT "+(page-1)*limit+","+limit;
		System.out.println(sql);
		Connection con = DruidUtil.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<User> list = new ArrayList<User>();
		while (rs.next()) {
			User user1= new User();
			user1.setUserId(rs.getInt("userId"));
			user1.setUserName(rs.getString("userName"));
			user1.setUserPass(rs.getString("userPass"));
			user1.setEmail(rs.getString("email"));
			user1.setPhone(rs.getString("phone"));
			user1.setNoAdmin(rs.getInt("noAdmin"));
			user1.setFrist_time(rs.getTimestamp("frist_time"));
			user1.setLast_time(rs.getTimestamp("last_time"));
			user1.setNoDel(rs.getInt("noDel"));
			list.add(user1);
		}
		DruidUtil.close(rs, null, pstmt, con);
		return list;
		
	}
}
