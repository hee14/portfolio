package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class RoomBookDataBean implements Serializable {

	private int book_id ;
	private int num;
	private String meet_subtitle;
	private String meet_date_start;
	private String meet_date_end;
	private String meet_time_start;
	private String meet_time_end;
	private int membercnt;
	private String meet_location;
	private String fee;
	private Timestamp reg_date;

	
	
	
	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public int getMembercnt() {
		return membercnt;
	}

	public void setMembercnt(int membercnt) {
		this.membercnt = membercnt;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMeet_subtitle() {
		return meet_subtitle;
	}

	public void setMeet_subtitle(String meet_subtitle) {
		this.meet_subtitle = meet_subtitle;
	}

	public String getMeet_date_start() {
		return meet_date_start;
	}

	public void setMeet_date_start(String meet_date_start) {
		this.meet_date_start = meet_date_start;
	}

	public String getMeet_date_end() {
		return meet_date_end;
	}

	public void setMeet_date_end(String meet_date_end) {
		this.meet_date_end = meet_date_end;
	}

	public String getMeet_time_start() {
		return meet_time_start;
	}

	public void setMeet_time_start(String meet_time_start) {
		this.meet_time_start = meet_time_start;
	}

	public String getMeet_time_end() {
		return meet_time_end;
	}

	public void setMeet_time_end(String meet_time_end) {
		this.meet_time_end = meet_time_end;
	}

	public String getMeet_location() {
		return meet_location;
	}

	public void setMeet_location(String meet_location) {
		this.meet_location = meet_location;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

}
