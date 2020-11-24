package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.ClientDAO;

@Service
public class ClientService {

	@Autowired ClientDAO dao;
	
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("homeP");
		mav.addObject("recommendedHomeList", dao.recommendedHomeList());
		return mav;
	}
	
}
