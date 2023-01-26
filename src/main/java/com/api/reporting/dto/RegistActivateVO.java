package com.api.reporting.dto;

public class RegistActivateVO {

	private String site_id;
	
	private Integer equipment_no;
	
	private String module_serial;
	
	private Integer module_no;
	
	private String operation_code;
	
	private String message;
	
	private String activate_time;
	
	private String activate_date;

	public String getSite_id() {
		return site_id;
	}

	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}

	public Integer getEquipment_no() {
		return equipment_no;
	}

	public void setEquipment_no(Integer equipment_no) {
		this.equipment_no = equipment_no;
	}

	public String getModule_serial() {
		return module_serial;
	}

	public void setModule_serial(String module_serial) {
		this.module_serial = module_serial;
	}

	public Integer getModule_no() {
		return module_no;
	}

	public void setModule_no(Integer module_no) {
		this.module_no = module_no;
	}

	public String getOperation_code() {
		return operation_code;
	}

	public void setOperation_code(String operation_code) {
		this.operation_code = operation_code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getActivate_time() {
		return activate_time;
	}

	public void setActivate_time(String activate_time) {
		this.activate_time = activate_time;
	}

	public String getActivate_date() {
		return activate_date;
	}

	public void setActivate_date(String activate_date) {
		this.activate_date = activate_date;
	}


}
