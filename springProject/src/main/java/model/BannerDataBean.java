package model;

import java.sql.Timestamp;

public class BannerDataBean {

	private int bannerId;
	private String bannerImg;
	private String bannerStatus;
	private Timestamp bannerRegDate;
	
	
	public int getBannerId() {
		return bannerId;
	}
	public void setBannerId(int bannerId) {
		this.bannerId = bannerId;
	}
	public String getBannerImg() {
		return bannerImg;
	}
	public void setBannerImg(String bannerImg) {
		this.bannerImg = bannerImg;
	}
	public String getBannerStatus() {
		return bannerStatus;
	}
	public void setBannerStatus(String bannerStatus) {
		this.bannerStatus = bannerStatus;
	}
	public Timestamp getBannerRegDate() {
		return bannerRegDate;
	}
	public void setBannerRegDate(Timestamp bannerRegDate) {
		this.bannerRegDate = bannerRegDate;
	}
	
	
	@Override
	public String toString() {
		return "BannerDataBean [bannerId=" + bannerId + ", bannerImg=" + bannerImg + ", bannerStatus=" + bannerStatus
				+ ", bannerRegDate=" + bannerRegDate + "]";
	}

	
}
