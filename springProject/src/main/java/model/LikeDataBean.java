package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class LikeDataBean implements  Serializable{

	private int likenum;
	private int articlenum;
	private String email;
	private int likecheck;
	
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getArticlenum() {
		return articlenum;
	}
	public void setArticlenum(int articlenum) {
		this.articlenum = articlenum;
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
		return "LikeDataBean [likenum=" + likenum + ", articlenum=" + articlenum + ", email=" + email + ", likecheck="
				+ likecheck + "]";
	}
	
	
	
	

}
