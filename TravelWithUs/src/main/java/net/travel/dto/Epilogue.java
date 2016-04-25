package net.travel.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Epilogue {
	private int num;
	private String id;
	private String title;
	private Date date;
	private String description;
	private int hit;
	
	public Epilogue() {
	}
	
	public Epilogue(int num, String id, String title, Date date, String description, int hit) {
		this.num = num;
		this.id = id;
		this.title = title;
		this.date = date;
		this.description = description;
		this.hit = hit;
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
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getTitle() {
		return this.title;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public Date getDate() {
		return this.date;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public int getHit() {
		return this.hit;
	}
}
