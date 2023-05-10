package com.smhrd.model;

import org.apache.catalina.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(userVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("join",vo);
		session.close();
		return cnt;
	}
	
	public userVO login(userVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		userVO lvo = session.selectOne("login",vo);
		session.close(); 
		return lvo;
	}
	
	public int update(userVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("update",vo);
		session.close();
		return cnt;
	}
}
