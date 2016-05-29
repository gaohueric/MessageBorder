package com.imau.model;

import java.sql.Date;

public class Revert {
	private Integer id;
	private String content;
	private Date revertTime;
	private Message message;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRevertTime() {
		return revertTime;
	}
	public void setRevertTime(Date revertTime) {
		this.revertTime = revertTime;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	

}
