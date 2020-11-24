package com.itbank.vo;

public class PageVO {
	private int perPage = 3;
	private int listStart;
	private int listEnd;
	private int pageStart;
	private int pageEnd;
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
	public int getListStart() {
		return listStart;
	}
	public void setListStart(int listStart) {
		this.listStart = listStart;
	}
	public int getListEnd() {
		return listEnd;
	}
	public void setListEnd(int listEnd) {
		this.listEnd = listEnd;
	}
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	
	
}
