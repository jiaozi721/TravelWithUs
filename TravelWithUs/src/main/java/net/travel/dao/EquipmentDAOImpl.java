package net.travel.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.travel.dto.Equipment;
import net.travel.mapper.Mapper;

@Repository
public class EquipmentDAOImpl implements EquipmentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<Equipment> getEquipList() {
		ArrayList<Equipment> list = new ArrayList<Equipment> ();
		Mapper mapper = sqlSession.getMapper(Mapper.class);
		list = mapper.GetEquipList();
		return list;
	}
	
	@Override
	public Equipment getEquipDetail(int num) {
		Equipment equip = new Equipment();
		Mapper mapper = sqlSession.getMapper(Mapper.class);
		equip = mapper.GetEquipmentDetail(num);
		return equip;
	}
	
	@Override
	public ArrayList<Equipment> getTop3List() {
		ArrayList<Equipment> list = new ArrayList<Equipment> ();
		Mapper mapper = sqlSession.getMapper(Mapper.class);
		list = mapper.getTop3List();
		return list;
	}
	
}
