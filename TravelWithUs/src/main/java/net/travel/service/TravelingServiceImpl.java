package net.travel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.travel.dao.EpilogueDAOImpl;
import net.travel.dao.EquipmentDAOImpl;
import net.travel.dao.MemberDAOImpl;
import net.travel.dao.TravelDAOImpl;

import net.travel.dto.Epilogue;
import net.travel.dto.Equipment;
import net.travel.dto.Member;
import net.travel.dto.Travel;

@Service
public class TravelingServiceImpl implements TravelingService{
	
	@Autowired
	private MemberDAOImpl memberDAOimpl;
	
	@Autowired
	private EquipmentDAOImpl equipmentDAOimpl;
	
	@Autowired
	private TravelDAOImpl travelDAOimpl;
	
	@Autowired
	private EpilogueDAOImpl epDAOiml;
	
	private String alert;
	
	
	
	public String getAlert() {
		return alert;
	}
	
	public void setAlert(String alert) {
		this.alert = alert;
	}
		
	//Login check!
	@Override
	public boolean loginCheck(String id, String pw) {
		boolean isMember;
		Member member = new Member();
		member = memberDAOimpl.InqueryID(id);
		if(member != null) {
			member = memberDAOimpl.InqueryPW(id, pw);
			if(member != null) {
				isMember = true;
				setAlert("Login Success! Hello "+memberDAOimpl.getUserName(id)+". ");
			}
			else {
				isMember = false;
				setAlert("Password is not correct !");
			}
		}
		
		else {
			isMember = false;
			setAlert("ID is not existed.");
		}
		return isMember;
	}
	
	
	//Sign up
	@Override
	public boolean RegisterUser(String id, String pw, String name, String phone, String email, String nation) {	
		boolean state;
		if(id!=null && pw!=null && name!=null && phone!=null && email!=null && nation!=null) {
			Member member = new Member(id,pw,name,phone,email,nation);
		
			if(memberDAOimpl.InqueryID(member.getId()) == null) {
				memberDAOimpl.InsertNewUser(member);
				state = true;
				setAlert("Registration is successed !");
			}
		
			else {
				setAlert("ID is existed.");
				state = false;
			}
		}
		
		else {
			setAlert("All of values can not be null!.");
			state = false;
		}
		
		return state;
	}

	
	@Override
	public ArrayList<Equipment> ListAllOfEquipment() {
		ArrayList<Equipment> list = new ArrayList<Equipment> ();
		try {
			list = equipmentDAOimpl.getEquipList();
		}
		catch(Exception ex) {
			ex.printStackTrace();
			setAlert("Not existed information about equipment.");
		}
		return list;
	}
	
	@Override
	public Equipment ShowDetailInformation(int num) {
		
		Equipment equip = new Equipment();
		try {
			equip = equipmentDAOimpl.getEquipDetail(num);
		}
		catch(Exception ex) {
			ex.printStackTrace();
			setAlert("Not existed information about equipment.");
		}
		return equip;
	}
	

	@Override
	public ArrayList<Travel> ListAllOfTravel() {
		ArrayList<Travel> list = new ArrayList<Travel> ();
		list = travelDAOimpl.GetAllOfTravel();
		return list;
	}
	
	@Override
	public Travel getTravelInfo(int num) {
		Travel travel = new Travel ();
		travel = travelDAOimpl.getTravel(num);
		return travel;
	}
	
	@Override
	public ArrayList<Epilogue> ListAllEp() {
		ArrayList<Epilogue> list = new ArrayList<Epilogue> ();
		list = epDAOiml.getAllEp();
		return list;
	}
	
	@Override
	public Epilogue getEpInfo(int num) {
		Epilogue ep = new Epilogue();
		ep = epDAOiml.getEp(num);
		epDAOiml.updateHit(num);
		return ep;
	}
	
	@Override
	public ArrayList<Travel> GetTop8Travel() {
		ArrayList<Travel> list = new ArrayList<Travel> ();
		list = travelDAOimpl.GetTop8Travel();
		return list;
	}
	
	@Override
	public ArrayList<Equipment> GetTop3Product() {
		ArrayList<Equipment> list = new ArrayList<Equipment> ();
		try {
			list = equipmentDAOimpl.getTop3List();
		}
		catch(Exception ex) {
			ex.printStackTrace();
			setAlert("Not existed information about equipment.");
		}
		return list;
	}
}
