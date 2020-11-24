package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import com.itbank.service.BoardService;
import com.itbank.service.LookupService;

@Controller
public class LookupController {
	
	@Autowired private LookupService ls;
//	@Autowired private BoardService bs;
	
	@RequestMapping(value = "/shopSingle/{MerchanCode}/", method = RequestMethod.GET)
	public ModelAndView lookupPage(@PathVariable("MerchanCode")String merchanCode) { // service?��?�� �?리하겠음.
		return ls.lookupPage(1,merchanCode);
	}
	
	@RequestMapping("shopSingle/{page}/{merchanCode}/")
	public ModelAndView lookupList(@PathVariable("page") int page, @PathVariable("merchanCode") String merchanCode) {
		return ls.lookupPage(page, merchanCode);
	}
}
