package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class NoteDataBean implements Serializable{
	
	private int noteid; // 쪽지id
	private String notereceiver; // 받는사람_수신자
	private String notesender; // 보낸사람_발신자
	private String content; // 쪽지내용
	private Timestamp send_date; // 보낸날짜
	private Timestamp read_date; // 읽은날짜
	private int status; // 읽었는지확인상태(0: 읽지않은상태, 1: 읽음)
	private int rethatid; /* 답장인 경우 원본 글의 id 값을 가짐 , 답장이 아닌 경우 0*/
	private int rethat; /* 답장을 보낸 경우 1로 지정*/
	
	
	public int getNoteid() {
		return noteid;
	}
	public void setNoteid(int noteid) {
		this.noteid = noteid;
	}
	public String getNotereceiver() {
		return notereceiver;
	}
	public void setNotereceiver(String notereceiver) {
		this.notereceiver = notereceiver;
	}
	public String getNotesender() {
		return notesender;
	}
	public void setNotesender(String notesender) {
		this.notesender = notesender;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getSend_date() {
		return send_date;
	}
	public void setSend_date(Timestamp send_date) {
		this.send_date = send_date;
	}
	public Timestamp getRead_date() {
		return read_date;
	}
	public void setRead_date(Timestamp read_date) {
		this.read_date = read_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}	
	public int getRethatid() {
		return rethatid;
	}
	public void setRethatid(int rethatid) {
		this.rethatid = rethatid;
	}
	public int getRethat() {
		return rethat;
	}
	public void setRethat(int rethat) {
		this.rethat = rethat;
	}
	
	
	@Override
	public String toString() {
		return "NoteDataBean [noteid=" + noteid + ", notereceiver=" + notereceiver + ", notesender=" + notesender
				+ ", content=" + content + ", send_date=" + send_date + ", read_date=" + read_date + ", status="
				+ status + ", rethatid=" + rethatid + ", rethat=" + rethat + "]";
	}
	

}
