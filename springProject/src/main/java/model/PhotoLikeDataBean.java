package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class PhotoLikeDataBean implements Serializable{

	private int likenum;
	private int photonum;
	private String email;
	private int likecheck;
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getPhotonum() {
		return photonum;
	}
	public void setPhotonum(int photonum) {
		this.photonum = photonum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	@Override
	public String toString() {
		return "PhotoLikeDataBean [likenum=" + likenum + ", photonum=" + photonum + ", email=" + email + ", likecheck="
				+ likecheck + "]";
	}
	
	
	

}
