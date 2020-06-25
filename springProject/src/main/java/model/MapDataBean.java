package model;

import java.io.Serializable;

public class MapDataBean implements Serializable {

	
	private int book_id; // 일정모임테이블 id -> primary key(classbook)테이블에 존재
	private int classnum; // 가입한 모임 id(hobbyclass 참조) -> classjoin테이블에 존재
	private String interestPng; // 최상위 관심사 이미지 가져오기
	private String meet_title; // 모임클래스 제목 -> classjoin 테이블
	private String meet_subtitle; // 일정모임(정모) 제목 -> classbook 테이블
	private String meet_location; // 일정모임(정모)의 장소 -> classbook 테이블
	private String name; // 일정모임에 	가입된 회원 이름 -> classjoin 테이블
	private String address; // 회원의 현재위치주소 -> 현재위치	
	
	
	public int getClassnum() {
		return classnum;
	}
	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}
	public String getMeet_title() {
		return meet_title;
	}
	public void setMeet_title(String meet_title) {
		this.meet_title = meet_title;
	}
	public String getInterestPng() {
		return interestPng;
	}
	public void setInterestPng(String interestPng) {
		this.interestPng = interestPng;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getMeet_subtitle() {
		return meet_subtitle;
	}
	public void setMeet_subtitle(String meet_subtitle) {
		this.meet_subtitle = meet_subtitle;
	}
	public String getMeet_location() {
		return meet_location;
	}
	public void setMeet_location(String meet_location) {
		this.meet_location = meet_location;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "MapDataBean [book_id=" + book_id + ", classnum=" + classnum + ", interestPng=" + interestPng
				+ ", meet_title=" + meet_title + ", meet_subtitle=" + meet_subtitle + ", meet_location=" + meet_location
				+ ", name=" + name + ", address=" + address + "]";
	}
	
	

}
