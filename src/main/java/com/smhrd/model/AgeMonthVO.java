package com.smhrd.model;

public class AgeMonthVO {
	private String mon;
	private String user_age;
	private String age_month;
	private String user_id;
	
	
	
	@Override
	public String toString() {
		return "AgeMonthVO [mon=" + mon + ", user_age=" + user_age + ", age_month=" + age_month + ", user_id=" + user_id
				+ "]";
	}



	public AgeMonthVO() {
		super();
	}



	public AgeMonthVO(String mon, String user_age, String age_month, String user_id) {
		super();
		this.mon = mon;
		this.user_age = user_age;
		this.age_month = age_month;
		this.user_id = user_id;
	}



	public String getMon() {
		return mon;
	}



	public void setMon(String mon) {
		this.mon = mon;
	}



	public String getUser_age() {
		return user_age;
	}



	public void setUser_age(String user_age) {
		this.user_age = user_age;
	}



	public String getAge_month() {
		return age_month;
	}



	public void setAge_month(String age_month) {
		this.age_month = age_month;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
