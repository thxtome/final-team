package kr.co.doublecome.auction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.auction.service.AuctionServiceImpl;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.SearchAuction;

@Controller("kr.co.doublecome.auction.controller.AuctionController")
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	private AuctionServiceImpl service;
	
	@RequestMapping("/searchAuction.do")
	public void auctionList(int categoryCode, String categoryName, Model model) {
		SearchAuction search = new SearchAuction();
		Category category= new Category();
		category.setCategoryCode(categoryCode);
		category.setCategoryName(categoryName);
		search.setCategoryCode(categoryCode);
		model.addAttribute("selectCategery",category);
		model.addAttribute("category",service.listCategory());
		model.addAttribute("auctionlist", service.auctionList(search));		
	}
	@RequestMapping("/searchActionList.do")
	@ResponseBody
	public List<Auction> auctionSearchList(@RequestBody SearchAuction search) {
		System.out.println(search.getCategoryCode());
		return service.auctionList(search);
	}
}
