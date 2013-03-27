package com.zuni.drivinginstructor.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value = {"", "/" ,"/dashboard"}, method = RequestMethod.GET)
	public String showDashBoard(Model model) {
		return "admin/dashboard";
	}
	
	@RequestMapping(value = {"/instructor"}, method = RequestMethod.GET)
	public String getAddEditInstructor(Model model) {
		return "admin/addEditInstructor";
	}
	
	@RequestMapping(value = {"/instructor"}, method = RequestMethod.POST)
	public String saveAddEditInstructor(Model model) {
		return "admin/addEditInstructor";
	}
}
