package xxk.train.entity;

import core.entity.CoreEntity;

import java.sql.Timestamp;
//用户表
public class User extends CoreEntity {
	private int userId;
	private String userName;
	private String userPass;
	private String email;
	private String phone;
	private int noAdmin;
	private Timestamp frist_time ;
	private Timestamp last_time ;
	private int noDel ;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getNoAdmin() {
		return noAdmin;
	}
	public void setNoAdmin(int noAdmin) {
		this.noAdmin = noAdmin;
	}
	public Timestamp getFrist_time() {
		return frist_time;
	}
	public void setFrist_time(Timestamp frist_time) {
		this.frist_time = frist_time;
	}
	public Timestamp getLast_time() {
		return last_time;
	}
	public void setLast_time(Timestamp last_time) {
		this.last_time = last_time;
	}
	public int getNoDel() {
		return noDel;
	}
	public void setNoDel(int noDel) {
		this.noDel = noDel;
	}

	@Override
	public String toString() {
		return "User{" +
				"userId=" + userId +
				", userName='" + userName + '\'' +
				", userPass='" + userPass + '\'' +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", noAdmin=" + noAdmin +
				", frist_time=" + frist_time +
				", last_time=" + last_time +
				", noDel=" + noDel +
				'}';
	}
}
