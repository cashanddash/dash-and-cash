package com.smhrd.model;

public class assetVO {

	private int asset_seq;
	private String user_id;
	private String bank_name;
	private int account_balance;
	private String dept_card_name;
	private int dept_card_amount;
	private String dept_loan_name;
	private int dept_loan_amount;
	private int total_asset;
	
	public assetVO() {
		
	}
	
	public assetVO(String user_id, String bank_name, int account_balance, String dept_card_name, int dept_card_amount,
			String dept_loan_name, int dept_loan_amount) {
		super();
		this.user_id = user_id;
		this.bank_name = bank_name;
		this.account_balance = account_balance;
		this.dept_card_name = dept_card_name;
		this.dept_card_amount = dept_card_amount;
		this.dept_loan_name = dept_loan_name;
		this.dept_loan_amount = dept_loan_amount;
	}

	public int getAsset_seq() {
		return asset_seq;
	}

	public void setAsset_seq(int asset_seq) {
		this.asset_seq = asset_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBank_name() {
		if(bank_name==null) {
			return "은행 선택";
		}
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public int getAccount_balance() {
		return account_balance;
	}

	public void setAccount_balance(int account_balance) {
		this.account_balance = account_balance;
	}

	public String getDept_card_name() {
		if(dept_card_name == null) {
			return "카드 선택";
		}
		return dept_card_name;
	}

	public void setDept_card_name(String dept_card_name) {
		this.dept_card_name = dept_card_name;
	}

	public int getDept_card_amount() {
		
		return dept_card_amount;
	}

	public void setDept_card_amount(int dept_card_amount) {
		this.dept_card_amount = dept_card_amount;
	}

	public String getDept_loan_name() {
		if(dept_loan_name == null) {
			return "은행 선택";
		}
		return dept_loan_name;
	}

	public void setDept_loan_name(String dept_loan_name) {
		this.dept_loan_name = dept_loan_name;
	}

	public int getDept_loan_amount() {
		return dept_loan_amount;
	}

	public void setDept_loan_amount(int dept_loan_amount) {
		this.dept_loan_amount = dept_loan_amount;
	}

	public int getTotal_asset() {
		return total_asset;
	}

	public void setTotal_asset(int total_asset) {
		this.total_asset = total_asset;
	}

	@Override
	public String toString() {
		return "assetVO [asset_seq=" + asset_seq + ", user_id=" + user_id + ", bank_name=" + bank_name
				+ ", account_balance=" + account_balance + ", dept_card_name=" + dept_card_name + ", dept_card_amount="
				+ dept_card_amount + ", dept_loan_name=" + dept_loan_name + ", dept_loan_amount=" + dept_loan_amount
				+ ", total_asset=" + total_asset + "]";
	}
	
	

	public assetVO(String bank_name, int account_balance, String dept_card_name, int dept_card_amount,
			String dept_loan_name, int dept_loan_amount) {
		super();
		this.bank_name = bank_name;
		this.account_balance = account_balance;
		this.dept_card_name = dept_card_name;
		this.dept_card_amount = dept_card_amount;
		this.dept_loan_name = dept_loan_name;
		this.dept_loan_amount = dept_loan_amount;
	}

	public assetVO(int total_asset) {
		super();
		this.total_asset = total_asset;
	}

	public assetVO(int asset_seq, String user_id, String bank_name, int account_balance, String dept_card_name,
			int dept_card_amount, String dept_loan_name, int dept_loan_amount, int total_asset) {
		super();
		this.asset_seq = asset_seq;
		this.user_id = user_id;
		this.bank_name = bank_name;
		this.account_balance = account_balance;
		this.dept_card_name = dept_card_name;
		this.dept_card_amount = dept_card_amount;
		this.dept_loan_name = dept_loan_name;
		this.dept_loan_amount = dept_loan_amount;
		this.total_asset = total_asset;
	}
	public assetVO( String user_id, String bank_name, int account_balance, String dept_card_name,
			int dept_card_amount, String dept_loan_name, int dept_loan_amount, int total_asset) {
		super();
		this.user_id = user_id;
		this.bank_name = bank_name;
		this.account_balance = account_balance;
		this.dept_card_name = dept_card_name;
		this.dept_card_amount = dept_card_amount;
		this.dept_loan_name = dept_loan_name;
		this.dept_loan_amount = dept_loan_amount;
		this.total_asset = total_asset;
	}
	
	
	}