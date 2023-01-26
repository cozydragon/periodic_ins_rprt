package com.api.reporting.dto;

public class UserVO {

	private String user_id;
	
	private String user_name;
	
	private String password;
	
	private String email;
	
	private String create_time;
	
	private String update_time;
	
	private String role_id;
	
	private String site_id;

	//°¡»ó ¸íÄª
	private String role_name;
	
	//°¡»ó¸íÄª
	private String site_name;
	
	//°¡»ó¸íÄª
	private Boolean pw_change;
	
	//°¡»ó¸íÄª
	private String password_before;
	
	//°¡»ó¸íÄª
	private String password_confirm;
	

	public String getUser_id() {
		
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getSite_id() {
		return site_id;
	}

	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getSite_name() {
		return site_name;
	}

	public void setSite_name(String site_name) {
		this.site_name = site_name;
	}

	public Boolean getPw_change() {
		return pw_change;
	}

	public void setPw_change(Boolean pw_change) {
		this.pw_change = pw_change;
	}

	public String getPassword_before() {
		return password_before;
	}

	public void setPassword_before(String password_before) {
		this.password_before = password_before;
	}

	public String getPassword_confirm() {
		return password_confirm;
	}

	public void setPassword_confirm(String password_confirm) {
		this.password_confirm = password_confirm;
	}

	
	

}
