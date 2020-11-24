package com.itbank.vo;

//	이름           널 유형     
//	------------ - ------ 
//	MERCHAN_CODE   NUMBER 
//	SHOE_SIZE      NUMBER 
//	QUANTITY       NUMBER 

public class ShoeSizeVO {
	private String merchanCode;
	private int shoeSize;
	private int quantity;
	
	public String getMerchanCode() {
		return merchanCode;
	}
	public void setMerchanCode(String merchanCode) {
		this.merchanCode = merchanCode;
	}
	public int getShoeSize() {
		return shoeSize;
	}
	public void setShoeSize(int shoeSize) {
		this.shoeSize = shoeSize;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
