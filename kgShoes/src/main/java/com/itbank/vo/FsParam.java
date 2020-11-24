package com.itbank.vo;

public class FsParam {
	private int end;
	private int start;
	private int firstPrice;
	private int lastPrice;
	private String brand;
	private String category;
	private String sort;
	
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getFirstPrice() {
		return firstPrice;
	}
	public void setFirstPrice(int firstPrice) {
		this.firstPrice = firstPrice;
	}
	public int getLastPrice() {
		return lastPrice;
	}
	public void setLastPrice(int lastPrice) {
		this.lastPrice = lastPrice;
	}
}
