package com.bitcamp.home.board;

public class BoardVO {
	private int no;
	private String subject;
	private String content;
	private String userid;
	private int hit;
	private String ip;
	private String writedate;
	
	
	public BoardVO() {}
	public BoardVO(int no, String subject, String content) {
		this.no = no;
		this.subject = subject;
		this.content = content;
	}
	public BoardVO(int no, String subject, String content, String userid, int hit, String writedate) {
		this(no, subject, content);
		this.userid = userid;
		this.hit = hit;
		this.writedate = writedate;
	}
	
	public BoardVO(String subject, String content, String userid, String ip) {
		this.subject = subject;
		this.content = content;
		this.userid = userid;
		this.ip = ip;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
}
