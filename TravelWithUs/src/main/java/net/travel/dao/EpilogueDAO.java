package net.travel.dao;

import java.util.ArrayList;

import net.travel.dto.Epilogue;

public interface EpilogueDAO {
	
	//List all of epilogue
	public ArrayList<Epilogue> getAllEp();
	
	//Get the epilogue infomation
	public Epilogue getEp(int num);
	
	public void updateHit(int num);
}
