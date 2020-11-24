package com.itbank.vo;

import java.util.Date;

public class BoardReplyVO {

	private int renum;
	private String writer;
	private String context;
	private int reparent;
	private int redepth;
	private int reorder;
	private Date registDate;
	private int noticeNum;
	private int customerCode;
	
	public int getRenum() {
		return renum;
	}
	public void setRenum(int renum) {
		this.renum = renum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getReparent() {
		return reparent;
	}
	public void setReparent(int reparent) {
		this.reparent = reparent;
	}
	public int getRedepth() {
		return redepth;
	}
	public void setRedepth(int redepth) {
		this.redepth = redepth;
	}
	public int getReorder() {
		return reorder;
	}
	public void setReorder(int reorder) {
		this.reorder = reorder;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public int getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(int customerCode) {
		this.customerCode = customerCode;
	}
}
