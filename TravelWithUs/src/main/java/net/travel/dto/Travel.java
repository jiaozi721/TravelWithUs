package net.travel.dto;

import org.springframework.stereotype.Component;

@Component
public class Travel {
	
	private int num;
	private String title;
	private int price;
	private String image;
	private String description;
	private String departure;
	private String travelpath;
	private int duration;
	private double latitude;
	private double longitude;
	private int hit;
	private String l_image;
	
	public Travel() {
	}
	
	public Travel(int num, String title, int price, String image, String description,
					String departure, String travelpath, int duration, double latitude, double longitude, int hit, String l_image) {
		this.num = num;
		this.title = title;
		this.price = price;
		this.image = image;
		this.description = description;
		this.departure = departure;
		this.travelpath = travelpath;
		this.duration = duration;
		this.latitude = latitude;
		this.longitude = longitude;
		this.hit = hit;
		this.l_image = l_image;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getNum() {
		return this.num;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getTitle() {
		return this.title;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getPrice() {
		return this.price;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getImage() {
		return this.image;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	
	public String getDeparture() {
		return this.departure;
	}
	
	public void setTravelpath(String travelPath) {
		this.travelpath = travelPath;
	}
	
	public String getTravelpath() {
		return this.travelpath;
	}
	
	public void setDuration(int duration) {
		this.duration = duration;
	}
	
	public int getDuration() {
		return this.duration;
	}
	
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	
	public double getLatitude() {
		return this.latitude;
	}
	
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	public double getLongitude() {
		return this.longitude;
	}
	
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public int getHit() {
		return this.hit;
	}
	
	public void setL_image(String l_image) {
		this.l_image = l_image;
	}
	
	public String getL_image() {
		return this.l_image;
	}
	
	
}
