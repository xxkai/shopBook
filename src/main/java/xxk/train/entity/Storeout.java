package xxk.train.entity;

import java.sql.Timestamp;

public class Storeout {
	private int storeoutId;
	private int bookId;
	private String userName;
	private Timestamp dateTime;
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	private int storeoutNum;
	public int getStoreoutId() {
		return storeoutId;
	}
	public void setStoreoutId(int storeoutId) {
		this.storeoutId = storeoutId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getStoreoutNum() {
		return storeoutNum;
	}
	public void setStoreoutNum(int storeoutNum) {
		this.storeoutNum = storeoutNum;
	}
	@Override
	public String toString() {
		return "Storeout [storeoutId=" + storeoutId + ", bookId=" + bookId + ", userName=" + userName + ", dateTime="
				+ dateTime + ", storeoutNum=" + storeoutNum + "]";
	}
	
	
}
