package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class LogonDataBean implements Serializable {

	private int memid; // 회원 id
	private String email; // 회원이메일
	private String gender; // 성별
	private String profileImg; // 프로필이미지
	private String name; // 닉네임
	private String password; // 비밀번호
	private String phone; // 전화번호
	private String birthday; // 생일
	private String address; // 내지역
	private Timestamp reg_date;

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public int getMemid() {
		return memid;
	}

	public void setMemid(int memid) {
		this.memid = memid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "LogonDataBean [memid=" + memid + ", email=" + email + ", gender=" + gender + ", profileImg="
				+ profileImg + ", name=" + name + ", password=" + password + ", phone=" + phone + ", birthday="
				+ birthday + ", address=" + address + "]";
	}

}
