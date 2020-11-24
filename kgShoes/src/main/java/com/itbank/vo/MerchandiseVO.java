package com.itbank.vo;

//	이름           널        유형            
//	------------ -------- ------------- 
//	MERCHAN_CODE NOT NULL NUMBER        
//	MERCHAN_NAME          VARCHAR2(50)  
//	IMG_SRC               VARCHAR2(300) 
//	PRICE                 NUMBER        
//	BRAND                 VARCHAR2(50)  
//	CATEGORY              VARCHAR2(50)  

public class MerchandiseVO {
	private String detailSrc;
	private String merchanCode;
	private String merchanName;
	private String imgSrc;
	private int price;
	private String brand;
	private String category;
	private int quantity;
	private int discRate;
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getDiscRate() {
		return discRate;
	}
	public void setDiscRate(int discRate) {
		this.discRate = discRate;
	}
	
	public String getDetailSrc() {
		return detailSrc;
	}
	public void setDetailSrc(String detailSrc) {
		this.detailSrc = detailSrc;
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
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
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
