package com.api.reporting.cmn.dto;

/*
 * Author : 박준영
 * Date   : 2023-03-21
 * */
public class SignUpDTO {
	
	// 아이디
	private String user_id;
	// 이름
	private String user_nm;
	// 패스워드
	private String pswd;
	// 이메일
	private String user_eml_addr;
	// 권한
	private String site_id;
	// 등록 아이디
	private String reg_id;
	// 등록 일자
	private String reg_dt;
	// 수정 아이디
	private String mdfcn_id;
	// 수정 일자
	private String mdfcn_dt;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public String getUser_eml_addr() {
		return user_eml_addr;
	}
	public void setUser_eml_addr(String user_eml_addr) {
		this.user_eml_addr = user_eml_addr;
	}
	public String getSite_id() {
		return site_id;
	}
	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getMdfcn_id() {
		return mdfcn_id;
	}
	public void setMdfcn_id(String mdfcn_id) {
		this.mdfcn_id = mdfcn_id;
	}
	public String getMdfcn_dt() {
		return mdfcn_dt;
	}
	public void setMdfcn_dt(String mdfcn_dt) {
		this.mdfcn_dt = mdfcn_dt;
	}
	
	@Override
	public String toString() {
		return "SignUp = [ id : " + user_id + ", " + "reg_date : " + reg_dt + " ]";
	}
}
