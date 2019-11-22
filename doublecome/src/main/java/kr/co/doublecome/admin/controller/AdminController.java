package kr.co.doublecome.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.admin.service.AdminService;
import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.SearchAuction;
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
	public void retrieveReportedAuction() {
	}
	
	@RequestMapping("/retrieveAuctionStatistics.do")
	public void retrieveAuctionStatistics() {}
	
	@RequestMapping("/retrieveAuction.do")
	public void retrieveAuction(Model model) {
		model.addAttribute("categories", service.retrieveCategoryForAucion());		
	}
	
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
	
	@RequestMapping("searchAuction.do")
	@ResponseBody 
	public AjaxPage searchUser(@RequestBody SearchAuction sa) {
		return service.retrieveAuctionForAdmin(sa);
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
	
	@RequestMapping("/removeCategories.do")
	@ResponseBody 
	public void removeCategories(@RequestBody List<String> categoryCodes) {
		service.removeCategories(categoryCodes);
	}
	
	@RequestMapping("/retrieveCategories.do")
	@ResponseBody 
	public AjaxPage retrieveCategories(@RequestBody Search search) {
		return service.retrieveCategories(search);
	}
	
	@RequestMapping("/editCategory.do")
	@ResponseBody 
	public void editCategories(@RequestBody Category cat) {
		service.editCategory(cat);
	}
	
	@RequestMapping("/addCategory.do")
	@ResponseBody 
	public void addCategories(@RequestBody Category cat) {
		service.addCategory(cat);
	}
	
}
