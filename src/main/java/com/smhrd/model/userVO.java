package com.smhrd.model;

public class userVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_age;
	private String user_nick;
	private int user_salary;
	
	
	
	@Override
	public String toString() {
		return "userVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_age="
				+ user_age + ", user_nick=" + user_nick + ", user_salary=" + user_salary + "]";
	}

	public userVO() {
		
	}

	public userVO(String user_id, String user_nick, int user_salary) {
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.user_salary = user_salary;
	}

	public userVO(String user_id, String user_pw) {
		this.user_id = user_id;
		this.user_pw = user_pw;
	}



	public userVO(String user_id) {
		super();
		this.user_id = user_id;
	}

	public userVO(String user_id, String user_pw, String user_name, String user_age, String user_nick,
			int user_salary) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_age = user_age;
		this.user_nick = user_nick;
		this.user_salary = user_salary;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_pw() {
		return user_pw;
	}



	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_age() {
		return user_age;
	}



	public void setUser_age(String user_age) {
		this.user_age = user_age;
	}



	public String getUser_nick() {
		return user_nick;
	}



	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}



	public int getUser_salary() {
		return user_salary;
	}



	public void setUser_salary(int user_salary) {
		this.user_salary = user_salary;
	}
	
	
	 
}
