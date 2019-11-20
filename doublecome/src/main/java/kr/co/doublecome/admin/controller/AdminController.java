package kr.co.doublecome.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.admin.service.AdminService;
import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.SearchUser;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService service;
	

	@RequestMapping("/basic.do")
	public void basic() {}
	
	@RequestMapping("/retrieveUser.do")
	public void retrieveUser(SearchUser su) {}
	
	@RequestMapping("/retrieveReportedUser.do")
	public void retrieveReportedUser() {}
	
	@RequestMapping("/retrieveUserStatistics.do")
	public void retrieveUserStatistics() {}
	
	@RequestMapping("/retrieveReportedAuction.do")
	public void retrieveReportedAuction() {}
	
	@RequestMapping("/retrieveAuctionStatistics.do")
	public void retrieveAuctionStatistics() {}
	
	@RequestMapping("/retrieveAuction.do")
	public void retrieveAuction() {}
	
	@RequestMapping("/retrieveDeal.do")
	public void retrieveDeal() {}
	
	@RequestMapping("/retrieveCategory.do")
	public void retrieveCategory() {}
	
	@RequestMapping("/retrieveReport.do")
	public void retrieveReport() {}
	
	@RequestMapping("/searchUser.do")
	@ResponseBody 
	public AjaxPage searchUser(@RequestBody SearchUser su) {
		System.out.println(su.getKeyword());
		return service.retrieveUserForAdmin(su);
	}
	
}
