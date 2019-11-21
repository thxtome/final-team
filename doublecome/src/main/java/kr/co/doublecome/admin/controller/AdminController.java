package kr.co.doublecome.admin.controller;

import java.util.Arrays;
import java.util.List;

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
		return service.retrieveUserForAdmin(su);
	}
	
	@RequestMapping("/detailReport.do")
	@ResponseBody 
	public AjaxPage retrieveReport(String userEmail, SearchUser su) {
		su.setListSize(5);
		su.setKeyword(userEmail);
		
		return service.retrieveReport(su);
	}
	
	@RequestMapping("/removeUser.do")
	@ResponseBody 
	public void removeUser(@RequestBody List<String> userEmails) {
		service.removeUser(userEmails);
	}
}
