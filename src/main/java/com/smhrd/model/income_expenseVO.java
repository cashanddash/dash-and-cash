package com.smhrd.model;

public class income_expenseVO {
	private int moneybook_seq;
	private String item_type;
	private String item_content;
	private int amount;
	private String item_tag;
	private String item_dt;
	private String user_id;
	
	private String target_name;

	
	public income_expenseVO(String item_type, String user_id) {
		super();
		this.item_type = item_type;
		this.user_id = user_id;
	}



	public income_expenseVO(String item_type,String item_content, int amount, String item_tag, String item_dt,
			String user_id) {
		super();
		this.item_type = item_type;
		this.item_content = item_content;
		this.amount = amount;
		this.item_tag = item_tag;
		this.item_dt = item_dt;
		this.user_id = user_id;
	}
	
	

	@Override
	public String toString() {
		return "income_expenseVO [moneybook_seq=" + moneybook_seq + ", item_type=" + item_type + ", item_content="
				+ item_content + ", amount=" + amount + ", item_tag=" + item_tag + ", item_dt=" + item_dt + ", user_id="
				+ user_id + "]";
	}

	public income_expenseVO(int amount,String item_tag,String user_id) {
		super();
		this.amount = amount;
		this.item_tag = item_tag;
		this.user_id = user_id;
	}



	public income_expenseVO() {

	}

	public income_expenseVO(int moneybook_seq, String item_type, String item_content, int amount, String item_tag,
			String item_dt, String user_id) {
		this.moneybook_seq = moneybook_seq;
		this.item_type = item_type;
		this.item_content = item_content;
		this.amount = amount;
		this.item_tag = item_tag;
		this.item_dt = item_dt;
		this.user_id = user_id;
	}

	public int getMoneybook_seq() {
		return moneybook_seq;
	}

	public void setMoneybook_seq(int moneybook_seq) {
		this.moneybook_seq = moneybook_seq;
	}

	public String getItem_type() {
		return item_type;
	}

	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}

	public String getItem_content() {
		return item_content;
	}

	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getItem_tag() {
		return item_tag;
	}

	public void setItem_tag(String item_tag) {
		this.item_tag = item_tag;
	}

	public String getItem_dt() {
		return item_dt;
	}

	public void setItem_dt(String item_dt) {
		this.item_dt = item_dt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getTarget_name() {
		return target_name;
	}



	public void setTarget_name(String target_name) {
		this.target_name = target_name;
	}
	
	
}
