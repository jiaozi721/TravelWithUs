package net.travel.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import net.travel.dto.Epilogue;
import net.travel.dto.Equipment;
import net.travel.dto.Member;
import net.travel.dto.Travel;

public interface Mapper {

	public Member InqueryID(String id);
	
	public Member InqueryPW(HashMap<String,String> hashmap);
	
	public String getUserName(String id);
	
	//////////////
	public void InsertNewUser(Member member);
	
	public ArrayList<Equipment> GetEquipList();
	
	
	//////
	public ArrayList<Equipment> getTop3List();
	
	
	public Equipment GetEquipmentDetail(int num);
	
	
	//////////
	public ArrayList<Travel> GetTravelList();
	
	public Travel getTravel(int num);
	
	
	
	public ArrayList<Travel> GetTop8Travel();
	
	
	////////
	public ArrayList<Epilogue> getEpList();
	

	
	/////
	public Epilogue getEp(int num);
	
	//update number of hit
	public void updateHit(int num);
}
