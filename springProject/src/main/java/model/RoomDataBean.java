package model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class RoomDataBean implements  Serializable {

	private int num;
	private int like_ca;
	private int like_sub;
	private String meet_title;
	private String photo;
	private String content;
	private String host;
	private int membercnt;
	private String location;
	private Timestamp reg_date;
	private String internames;
	private String intersubnames;
	
	
	public String getInternames() {
		return internames;
	}

	public void setInternames(String internames) {
		this.internames = internames;
	}

	public String getIntersubnames() {
		return intersubnames;
	}

	public void setIntersubnames(String intersubnames) {
		this.intersubnames = intersubnames;
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

	public int getLike_ca() {
		return like_ca;
	}

	public void setLike_ca(int like_ca) {
		this.like_ca = like_ca;
	}

	public int getLike_sub() {
		return like_sub;
	}

	public void setLike_sub(int like_sub) {
		this.like_sub = like_sub;
	}

	public String getMeet_title() {
		return meet_title;
	}

	public void setMeet_title(String meet_title) {
		this.meet_title = meet_title;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public int getMembercnt() {
		return membercnt;
	}

	public void setMembercnt(int membercnt) {
		this.membercnt = membercnt;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "RoomDataBean [num=" + num + ", like_ca=" + like_ca + ", like_sub=" + like_sub + ", meet_title="
				+ meet_title + ", photo=" + photo + ", content=" + content + ", host=" + host + ", membercnt="
				+ membercnt + ", location=" + location + ", reg_date=" + reg_date + ", internames=" + internames
				+ ", intersubnames=" + intersubnames + "]";
	}
	
	

}
