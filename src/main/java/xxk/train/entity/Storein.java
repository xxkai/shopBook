package xxk.train.entity;

import java.sql.Timestamp;

public class Storein {
	private int storeinId;
	private int bookId;
	private int storeinNum;
	private String userName;
	private Timestamp dateTime;
	
	
	public int getStoreinId() {
		return storeinId;
	}


	public void setStoreinId(int storeinId) {
		this.storeinId = storeinId;
	}


	public int getBookId() {
		return bookId;
	}


	public void setBookId(int bookId) {
		this.bookId = bookId;
	}


	public int getStoreinNum() {
		return storeinNum;
	}


	public void setStoreinNum(int storeinNum) {
		this.storeinNum = storeinNum;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Timestamp getDateTime() {
		return dateTime;
	}


	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}


	@Override
	public String toString() {
		return "Storein [storeinId=" + storeinId + ", bookId=" + bookId + ", storeinNum=" + storeinNum + ", userName="
				+ userName + ", dateTime=" + dateTime + "]";
	}
	

	
	
	

}
