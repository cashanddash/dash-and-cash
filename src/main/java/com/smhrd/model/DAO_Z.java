package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class DAO_Z {
// 장향미
	
	
	private SqlSessionFactory sqlSesstionFAcFactory = SqlSessionManager.getSqlSession();
//회원가입
	public int join(userVO vo) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		int cnt = session.insert("joinz", vo);
		session.close();
		return cnt;
	}
	
//id 중복확인
	public String checkIdz(String user_id) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		String idCheck = session.selectOne("checkIdz", user_id);
		session.close();
		return idCheck;
		
	}

// 내 자산 도넛그래프
	public List<assetVO> myAsset (String user_id){
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		List<assetVO> list = session.selectList("assetZ",user_id);
		session.close();
		return list;
	}

// 총 자산 가져오기
	public List<assetVO> allAll (assetVO vo) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		List<assetVO> allval = session.selectOne("allAll",vo);
		session.close();
		return allval;
	}

//내 자산 추가 
	public int assetAdd(assetVO vo) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		int cnt = session.insert("assetAdd", vo);
		session.close();
		return cnt;
	}
	
// 달력 수입지출 추가 	
	public int calAddInput(income_expenseVO vo) {
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		int cnt = session.insert("calAddInput", vo);
		session.close();
		return cnt;
	}
	
// 달력에 수입지출 정보 가져오기
	public List<income_expenseVO> getinout(income_expenseVO vo){
		SqlSession session = sqlSesstionFAcFactory.openSession(true);
		List<income_expenseVO> inout = session.selectList("getinout", vo);
		session.close();
		return inout;
	}
	
	
}
