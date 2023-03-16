package com.api.reporting.dto;

public class UserVO {

	private String user_id;
	
	private String user_nm;
	
	private String pswd;
	
	private String user_eml_addr;
	
	private String reg_dt;
	
	private String mdfcn_dt;
	
	private String authrt_id;
	
	private String site_id;

	//���� ��Ī
	private String authrt_nm;
	
	//�����Ī
	private String site_nm;
	
	//�����Ī
	private Boolean pw_change;
	
	//�����Ī
	private String pswd_before;
	
	//�����Ī
	private String pswd_confirm;

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

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getMdfcn_dt() {
		return mdfcn_dt;
	}

	public void setMdfcn_dt(String mdfcn_dt) {
		this.mdfcn_dt = mdfcn_dt;
	}

	public String getAuthrt_id() {
		return authrt_id;
	}

	public void setAuthrt_id(String authrt_id) {
		this.authrt_id = authrt_id;
	}

	public String getSite_id() {
		return site_id;
	}

	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}

	public String getAuthrt_nm() {
		return authrt_nm;
	}

	public void setAuthrt_nm(String authrt_nm) {
		this.authrt_nm = authrt_nm;
	}

	public String getSite_nm() {
		return site_nm;
	}

	public void setSite_nm(String site_nm) {
		this.site_nm = site_nm;
	}

	public Boolean getPw_change() {
		return pw_change;
	}

	public void setPw_change(Boolean pw_change) {
		this.pw_change = pw_change;
	}

	public String getPswd_before() {
		return pswd_before;
	}

	public void setPswd_before(String pswd_before) {
		this.pswd_before = pswd_before;
	}

	public String getPswd_confirm() {
		return pswd_confirm;
	}

	public void setPswd_confirm(String pswd_confirm) {
		this.pswd_confirm = pswd_confirm;
	}

	
	
	
}


