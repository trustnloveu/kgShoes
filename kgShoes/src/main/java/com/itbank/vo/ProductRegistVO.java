package com.itbank.vo;


// Bong putinto.jsp 파라미터들을 받기 위한 VO
public class ProductRegistVO {
	private String merchanCode;
	private String merchanName;
	//private String merchanImage;
	private int quantity250;
	private int quantity260;
	private int quantity270;
	private int quantity280;
	private int quantity290;
	private int quantity300;
	private int price;
	private String brand;
	private String category;
	//private String detailSrc;
	
	
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
	
	
	public int getQuantity250() {
		return quantity250;
	}
	public void setQuantity250(int quantity250) {
		this.quantity250 = quantity250;
	}
	public int getQuantity260() {
		return quantity260;
	}
	public void setQuantity260(int quantity260) {
		this.quantity260 = quantity260;
	}
	public int getQuantity270() {
		return quantity270;
	}
	public void setQuantity270(int quantity270) {
		this.quantity270 = quantity270;
	}
	public int getQuantity280() {
		return quantity280;
	}
	public void setQuantity280(int quantity280) {
		this.quantity280 = quantity280;
	}
	public int getQuantity290() {
		return quantity290;
	}
	public void setQuantity290(int quantity290) {
		this.quantity290 = quantity290;
	}
	public int getQuantity300() {
		return quantity300;
	}
	public void setQuantity300(int quantity300) {
		this.quantity300 = quantity300;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
		
	
}
