package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class PhotoDataBean implements  Serializable{

	private int photonum;
	private int num; //모임번호
	private String email;
	private String passwd;
	private Timestamp reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String content;
	private String ip;
	private String filename;
	private int filesize;
	private int like1; //좋아요수
	
	public int getPhotonum() {
		return photonum;
	}
	public void setPhotonum(int photonum) {
		this.photonum = photonum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getLike1() {
		return like1;
	}
	public void setLike1(int like1) {
		this.like1 = like1;
	}
	
	@Override
	public String toString() {
		return "PhotoDataBean [photonum=" + photonum + ", num=" + num + ", email=" + email + ", passwd=" + passwd
				+ ", reg_date=" + reg_date + ", readcount=" + readcount + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + ", content=" + content + ", ip=" + ip + ", filename=" + filename
				+ ", filesize=" + filesize + ", like1=" + like1 + "]";
	}
	
	
	
	
	

}
