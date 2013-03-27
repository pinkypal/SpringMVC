package com.zuni.drivinginstructor.report;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class ReportController {

	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public String showDashBoard(Model model) {
		return "admin/reports";
	}
}
