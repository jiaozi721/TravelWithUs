package net.travel.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.travel.mapper.Mapper;
import net.travel.dto.Member;


@Repository
public class MemberDAOImpl implements MemberDAO {	
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Member InqueryID(String id) {
		Member member = new Member();
		Mapper mapper = sqlSession.getMapper(Mapper.class) ;
		member = mapper.InqueryID(id);
		return member;
	}
	
	@Override
	public Member InqueryPW(String id,String pw) {
		Member member = new Member();
		Mapper mapper = sqlSession.getMapper(Mapper.class) ;
		HashMap<String,String> map = new HashMap<String,String> ();
		map.put("id", id);
		map.put("pw", pw);
		member = mapper.InqueryPW(map);
		return member;
	}
	
	@Override
	public String getUserName(String id) {
		Mapper mapper = sqlSession.getMapper(Mapper.class) ;
		return mapper.getUserName(id);
	}
	
	
	@Override
	public void InsertNewUser(Member member){
		Mapper mapper = sqlSession.getMapper(Mapper.class) ;
		mapper.InsertNewUser(member);
	}		
}
