package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class DAO_L {
// 이철민
//		┌───────────────────────┐
// 		│	쳐다보지 마시오 			│
//		│				-주인백	│
//		└───────────────────────┘

	private SqlSessionFactory sqlSesstionFAcFactory = SqlSessionManager.getSqlSession();

	public int target_add(targetVO vo) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		int cnt = session.insert("target_add", vo);
		session.close();
		return cnt;

	}

	public ArrayList<targetVO> target_name_call(String user_id) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		List<targetVO> list = session.selectList("target_name_call", user_id);
		session.close();
		return (ArrayList<targetVO>) list;
	}
	
	public int target_name_del(int target_seq) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		int cnt = session.delete("target_name_del",target_seq);
		session.close();
		return cnt;
	}
	
	public ArrayList<targetVO> target_date_start(String user_id) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		List<targetVO> list = session.selectList("target_date_start", user_id);
		session.close();
		return (ArrayList<targetVO>) list;
	}
	public ArrayList<targetVO> target_date_end(String user_id) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		List<targetVO> list = session.selectList("target_date_end", user_id);
		session.close();
		return (ArrayList<targetVO>) list;
	}
	
	public List<targetVO> target_amount_cal(String user_id) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		List<targetVO> cnt = session.selectList("target_amount_cal",user_id);
		session.close();
		return cnt;
	}

	
	public  ArrayList<income_expenseVO> targetamount_add(String user_id) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		List<income_expenseVO> list = session.selectList("targetamount_add",user_id);
		session.close();
		return (ArrayList<income_expenseVO>) list;
	}

}
