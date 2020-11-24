package com.itbank.vo;

public class CartViewVO {
	private String merchanCode;
	private String imgUrl;
	private String merchanName;
	private int shoeSize;
	private int amount;
	private int singlePrice;
	private int totalPrice;
	
	public int getSinglePrice() {
		return singlePrice;
	}
	public void setSinglePrice(int singlePrice) {
		this.singlePrice = singlePrice;
	}	
	public String getMerchanCode() {
		return merchanCode;
	}
	public void setMerchanCode(String merchanCode) {
		this.merchanCode = merchanCode;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getMerchanName() {
		return merchanName;
	}
	public void setMerchanName(String merchanName) {
		this.merchanName = merchanName;
	}
	public int getShoeSize() {
		return shoeSize;
	}
	public void setShoeSize(int shoeSize) {
		this.shoeSize = shoeSize;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}
