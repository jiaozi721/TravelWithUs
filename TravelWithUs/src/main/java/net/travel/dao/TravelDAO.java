package net.travel.dao;

import java.util.ArrayList;

import net.travel.dto.Travel;

public interface TravelDAO {
	
	//List all of travel information
	public ArrayList<Travel> GetAllOfTravel(); 
	
	public ArrayList<Travel> GetTop8Travel();
	
	//One of travel information
	public Travel getTravel(int num);
	
}
