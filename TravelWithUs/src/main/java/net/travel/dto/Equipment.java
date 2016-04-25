package net.travel.dto;

import org.springframework.stereotype.Component;


@Component
public class Equipment {
	
	private int num;
	private String name;
	private int price;
	private String description;
	private String s_imagepath;
	private String l_imagepath;
	private int stock;
	private String madeby;
	private int hit;
	
	public Equipment() {
	}
	
	public Equipment(int num, String name, int price, String description, String s_imagepath, String l_imagepath,
						int stock, String madeby, int hit) {
		this.num = num;
		this.name = name;
		this.description = description;
		this.s_imagepath = s_imagepath;
		this.l_imagepath = l_imagepath;
		this.stock = stock;
		this.madeby = madeby;
		this.hit = hit;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getNum() {
		return this.num;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getPrice() {
		return this.price;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public void setS_imagepath(String s_imagepath) {
		this.s_imagepath = s_imagepath;
	}
	
	public String getS_imagepath() {
		return this.s_imagepath;
	}
	
	public void setL_imagepath(String l_imagepath) {
		this.l_imagepath = l_imagepath;
	}
	
	public String getL_imagepath() {
		return this.l_imagepath;
	}
	
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public int getStock() {
		return this.stock;
	}
	
	public void setMadeby(String madeby) {
		this.madeby = madeby;
	}
	
	public String getMadeby() {
		return this.madeby;
	}
	
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public int getHit() {
		return this.hit;
	}
}

