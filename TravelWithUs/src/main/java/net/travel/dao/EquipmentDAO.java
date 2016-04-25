package net.travel.dao;

import java.util.ArrayList;

import net.travel.dto.Equipment;

public interface EquipmentDAO {
	
	// Select all of equipments
	public ArrayList<Equipment> getEquipList();
	
	// Get Top 3 product
	public ArrayList<Equipment> getTop3List();
	
	// Select One of equipment and can see more detail information
	public Equipment getEquipDetail(int num);
}
