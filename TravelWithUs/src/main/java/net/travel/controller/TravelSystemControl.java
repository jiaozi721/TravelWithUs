package net.travel.controller;


import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.travel.dto.Epilogue;
import net.travel.dto.Equipment;
import net.travel.dto.Travel;
import net.travel.service.TravelingServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class TravelSystemControl {
	
	@Autowired
	private TravelingServiceImpl serviceImpl;
	private String loginstate = "";

	@RequestMapping(value ="/login/{id}/{pw}", method = RequestMethod.GET)
	@ResponseBody
	public String loginCheck(@PathVariable("id") String id, @PathVariable("pw") String pw) {  
		//
		if(serviceImpl.loginCheck(id, pw)) {
			loginstate = id;
		}
		return serviceImpl.getAlert();
	}
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET) 
	@ResponseBody
	public ModelAndView mainPage()	{
		ArrayList<Travel> list = new ArrayList<Travel> ();
		ArrayList<Equipment> top3 = new ArrayList<Equipment> ();
		list = serviceImpl.GetTop8Travel();
		top3 = serviceImpl.GetTop3Product();
		ModelAndView mav = new ModelAndView ();
		mav.addObject("list", list);
		mav.addObject("top3",top3);
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String signup() {
		return "login";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView signupCheck(HttpServletRequest request) {
		if(serviceImpl.RegisterUser(request.getParameter("id"), request.getParameter("password"), 
									request.getParameter("name"), request.getParameter("phone"),
									request.getParameter("email"), request.getParameter("nation"))) {
			return new ModelAndView("redirect:/home");
		}
		
		else {
			return new ModelAndView("redirect:/signup");
		}
	}
	
	@RequestMapping(value = "/signup", method=RequestMethod.GET)
	public String signaup() {
		return "signup";
	}

	@RequestMapping(value = "/Transportation", method=RequestMethod.GET)
	public String Transportation() {
		return "transportation";
	}
	
	
	@RequestMapping(value = "/logout")
	public ModelAndView Logout() {
		loginstate = "";
		return new ModelAndView("redirect:/home");
	}
	
	@RequestMapping(value = "/mylocation", method=RequestMethod.GET)
	public String myLocationService(HttpServletRequest request, Model model) {
		return "search";
	}
	
	@RequestMapping(value ="/Travel/{num}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showDetailTravel(@PathVariable("num") int num) {
		ModelAndView mav = new ModelAndView ();
		Travel travel = new Travel ();
		travel = serviceImpl.getTravelInfo(num);
		mav.setViewName("travelinfo");
		mav.addObject("info", travel);
		return mav;
	}
	
	@RequestMapping(value = "/Travel", method = RequestMethod.GET)
	public ModelAndView showAllTravel() {
		ArrayList<Travel> list = new ArrayList<Travel> ();
		list = serviceImpl.ListAllOfTravel();
		ModelAndView mav = new ModelAndView ();
		mav.addObject("list", list);
		mav.setViewName("travellist");
		return mav;
	}
	
	@RequestMapping(value = "/RecommendInfo",method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<Travel> recommendTravel() {
		ModelAndView mav = new ModelAndView ();
		ArrayList<Travel> list = new ArrayList<Travel> ();
		list = serviceImpl.ListAllOfTravel();
		mav.addObject("list", list);
		mav.setViewName("recommend");
		return list;
	}
	
	@RequestMapping(value = "/Recommend", method=RequestMethod.GET)
	public String recommend() {
		return "recommend";
	}
	
	@RequestMapping(value = "/status")
	@ResponseBody
	public String status() {
		return loginstate;
	}
	
		
	@RequestMapping(value ="/epilogue", method = RequestMethod.GET)
	public ModelAndView ListEpilogue() {
		ArrayList<Epilogue> list = new ArrayList<Epilogue> ();
		list = serviceImpl.ListAllEp();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("epilogue");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value ="/epilogue/{num}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showEpilogue(@PathVariable("num") int num) {
		Epilogue ep = new Epilogue ();
		ModelAndView mav = new ModelAndView ();
		ep = serviceImpl.getEpInfo(num);
		mav.setViewName("detailEP");
		mav.addObject("ep", ep);
		return mav;
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListProduct() {
		ArrayList<Equipment> list = new ArrayList<Equipment> ();
		ModelAndView mav = new ModelAndView();
		list = serviceImpl.ListAllOfEquipment();
		mav.setViewName("product");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "product/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showProduct(@PathVariable("num") int num) {
		Equipment equip = new Equipment ();
		ModelAndView mav = new ModelAndView();
		equip = serviceImpl.ShowDetailInformation(num);
		mav.setViewName("productdetail");
		mav.addObject("equip", equip);
		return mav;
	}
}
