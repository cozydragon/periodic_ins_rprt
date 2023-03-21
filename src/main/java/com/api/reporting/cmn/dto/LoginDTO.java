package com.api.reporting.cmn.dto;

public class LoginDTO {

	private String user_id;
	private String pswd;

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	
	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", pswd=" + pswd + "]";
	}
}
