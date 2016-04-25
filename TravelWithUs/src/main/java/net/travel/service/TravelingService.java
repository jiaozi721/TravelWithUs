package net.travel.service;

import java.util.ArrayList;

import net.travel.dto.Epilogue;
import net.travel.dto.Equipment;
import net.travel.dto.Travel;

public interface TravelingService {

	//Login check
	public boolean loginCheck(String id, String pw);

	//Sign Up
	public boolean RegisterUser(String id, String pw, String name, String phone, String email, String nation);
	
	//List all of equipment
	public ArrayList<Equipment> ListAllOfEquipment();
	
	//Show equipment detail information
	public Equipment ShowDetailInformation(int num);
	
	//List all of Travel
	public ArrayList<Travel> ListAllOfTravel();
	
	//Get Top 8 Travel
	public ArrayList<Travel> GetTop8Travel();
	
	//Get one of travel information
	public Travel getTravelInfo(int num);
	
	//List all epilogue
	public ArrayList<Epilogue> ListAllEp();
	
	//Get epilogue Infomation
	public Epilogue getEpInfo(int num);
	
	//Get Top 3 product
	public ArrayList<Equipment> GetTop3Product();
}
