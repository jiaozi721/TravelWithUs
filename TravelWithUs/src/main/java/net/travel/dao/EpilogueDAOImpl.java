package net.travel.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.travel.dto.Epilogue;
import net.travel.mapper.Mapper;

@Repository
public class EpilogueDAOImpl implements EpilogueDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<Epilogue> getAllEp() {
		ArrayList<Epilogue> list = new ArrayList<Epilogue> ();
		Mapper mapper = sqlSession.getMapper(Mapper.class);
		list = mapper.getEpList();
		return list;
	}
	
	@Override
	public Epilogue getEp(int num) {
		Epilogue ep = new Epilogue ();
		Mapper mapper = sqlSession.getMapper(Mapper.class);
		ep = mapper.getEp(num);	
		return ep;
	}
	
	@Override
	public void updateHit(int num) {
		Mapper mapper = sqlSession.getMapper(Mapper.class);
		mapper.updateHit(num);
	}
}
