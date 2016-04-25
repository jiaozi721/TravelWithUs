package net.travel.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.travel.dto.Travel;
import net.travel.mapper.Mapper;

@Repository
public class TravelDAOImpl implements TravelDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<Travel> GetAllOfTravel() {
		ArrayList<Travel> list = new ArrayList<Travel> ();
		Mapper mapper = sqlSession.getMapper(Mapper.class) ;
		list = mapper.GetTravelList();
		return list;
	}
	
	@Override
	public Travel getTravel(int num) {
		Travel travel = new Travel ();
		Mapper mapper = sqlSession.getMapper(Mapper.class);
		travel = mapper.getTravel(num);		
		return travel;
	}
	
	@Override
	public ArrayList<Travel> GetTop8Travel() {
		ArrayList<Travel> list = new ArrayList<Travel> ();
		Mapper mapper = sqlSession.getMapper(Mapper.class) ;
		list = mapper.GetTop8Travel();
		return list;
	}
	
}
