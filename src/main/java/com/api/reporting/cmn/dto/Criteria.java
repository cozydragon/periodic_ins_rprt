package com.api.reporting.cmn.dto;

public class Criteria {

	private int page;
	private int perPageNum;
	
	public Criteria(){
		page = 1;
		perPageNum = 10;
	}
	
	public void setPage(int page){
		if(page < 0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum){
		if(perPageNum < 0 || perPageNum > 100){
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage(){
		return this.page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	public int getPageStart(){
		return (this.page-1)*perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
