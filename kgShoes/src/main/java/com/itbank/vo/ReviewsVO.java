package com.itbank.vo;

import java.util.Date;

public class ReviewsVO {
	
	private int rnum;
	private String writer;
	private String context;
	private Date registDate;
	private String img;
	private String merchanCode;
	private int customerCode;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
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
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getMerchanCode() {
		return merchanCode;
	}
	public void setMerchanCode(String merchan_Code) {
		this.merchanCode = merchan_Code;
	}
	public int getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(int customer_Code) {
		this.customerCode = customer_Code;
	}

}	
