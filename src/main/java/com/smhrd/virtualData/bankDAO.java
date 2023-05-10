package com.smhrd.virtualData;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;
import com.smhrd.model.assetVO;
import com.smhrd.model.income_expenseVO;

public class bankDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	Random random = new Random();

	// 은행 가상데이터 insert
	public int vdInsert(bankVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("vdInsert", vo);
		session.close();
		return cnt;
	}

	// tb_user 테이블에서 회원명 select 후 ArrayList 입력
	public ArrayList<String> userNameSelect() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> list = session.selectList("userNameSelect");
		session.close();
		return (ArrayList<String>) list;
	}

	// tb_target 테이블에서 목표명 select 후 ArrayList 입력 + 소비태그
	public ArrayList<String> DetailList(String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> list = session.selectList("targetNameSelect", user_id);
		session.close();

		list.add("저축/보험");
		list.add("식비");
		list.add("공과금");
		list.add("생필품");
		list.add("품위유지비");
		list.add("교통비");
		list.add("기타");

		return (ArrayList<String>) list;

	}

	// tb_user 테이블에서 연봉 select 후 (코드 + 난수) * 천만 / 13 로 금액 산출
	public int Salary(String user_name) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int Salary = (Integer) session.selectOne("user_salarySelectVB", user_name);
		session.close();

		double db = random.nextDouble(); // 0~1 난수 랜덤
		int ys = (int) ((Salary + db) * 100) * 100000; // 코드 + 난수 * 천만
		return (ys / 13);

	}

	// virtualBank 테이블에서 잔액 얼마 있는지 확인
	public int check(bankVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int Balance = (Integer) session.selectOne("BalanceCheckSelect", vo);
		session.close();

		return Balance;
	}
	
	public int tb_in_exInsertvb(income_expenseVO ievo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("tb_in_exInsertvb", ievo);
		session.close();
		return cnt;
	}
	
	public ArrayList<bankVO> vbtSelectvb(String user_id) {	
		SqlSession session = sqlSessionFactory.openSession(true);
		List<bankVO> list = session.selectList("vbtSelectvb",user_id);
		session.close();
		return (ArrayList<bankVO>) list;
	}
	
	
	public ArrayList<bankVO> groupby3Selectvb(String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<bankVO> list = session.selectList("groupby3Selectvb",user_id);
		session.close();
		return (ArrayList<bankVO>) list;
	}



}
