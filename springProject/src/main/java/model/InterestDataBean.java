package model;

import java.io.Serializable;

public class InterestDataBean implements  Serializable {
	
	private String interestNum;
	private String interNum; 
	private String interestName;
	private String interestPng; 
	private String intersubNum; 
	private String intersubName;
	public String getInterestNum() {
		return interestNum;
	}
	public void setInterestNum(String interestNum) {
		this.interestNum = interestNum;
	}
	public String getInterNum() {
		return interNum;
	}
	public void setInterNum(String interNum) {
		this.interNum = interNum;
	}
	public String getInterestName() {
		return interestName;
	}
	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}
	public String getInterestPng() {
		return interestPng;
	}
	public void setInterestPng(String interestPng) {
		this.interestPng = interestPng;
	}
	public String getIntersubNum() {
		return intersubNum;
	}
	public void setIntersubNum(String intersubNum) {
		this.intersubNum = intersubNum;
	}
	public String getIntersubName() {
		return intersubName;
	}
	public void setIntersubName(String intersubName) {
		this.intersubName = intersubName;
	}
	@Override
	public String toString() {
		return "InterestDataBean [interestNum=" + interestNum + ", interNum=" + interNum + ", interestName="
				+ interestName + ", interestPng=" + interestPng + ", intersubNum=" + intersubNum + ", intersubName="
				+ intersubName + "]";
	} 
	
	

	

}
