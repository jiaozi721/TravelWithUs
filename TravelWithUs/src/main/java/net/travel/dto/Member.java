package net.travel.dto;

import org.springframework.stereotype.Component;


@Component
public class Member {
	
	private int num;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String nation;
	private int mileage;
	
	public Member() {
	}
	
	public Member(int num, String id, String pw, String name,
					String phone, String email, String nation, int mileage) {
		this.num = num;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.nation = nation;
		this.mileage = mileage;
	}
	
	public Member(String id, String pw, String name, String phone, String email, String nation) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.nation = nation;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getNum() {
		return this.num;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return this.id;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getPw() {
		return this.pw;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhone() {
		return this.phone;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setNation(String nation) {
		this.nation = nation;
	}
	
	public String getNation() {
		return this.nation;
	}
	
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	public int getMileage() {
		return this.mileage;
	}
}
