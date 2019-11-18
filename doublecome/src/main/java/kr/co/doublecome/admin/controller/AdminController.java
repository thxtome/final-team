package kr.co.doublecome.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/basic.do")
	public void basic() {}
	
	@RequestMapping("/retrieveUser.do")
	public void retrieveUser() {}
	
	@RequestMapping("/retrieveReportedUser.do")
	public void retrieveReportedUser() {}
	
	@RequestMapping("/retrieveReportedAuction.do")
	public void retrieveReportedAuction() {}
	
	@RequestMapping("/retrieveAuction.do")
	public void retrieveAuction() {}
	
	@RequestMapping("/retrieveDeal.do")
	public void retrieveDeal() {}
	
	@RequestMapping("/retrieveCategory.do")
	public void retrieveCategory() {}
	
	@RequestMapping("/retrieveReport.do")
	public void retrieveReport() {}
	
}
