package com.itbank.vo;

public class ItemChangeVO {
	private String merchanCode;
	private String merchanName;
	private int amount;
	private int discrate;
	private int price;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getDiscrate() {
		return discrate;
	}
	public void setDiscrate(int discrate) {
		this.discrate = discrate;
	}
	public String getMerchanCode() {
		return merchanCode;
	}
	public void setMerchanCode(String merchanCode) {
		this.merchanCode = merchanCode;
	}
	public String getMerchanName() {
		return merchanName;
	}
	public void setMerchanName(String merchanName) {
		this.merchanName = merchanName;
	}

	
	
}
