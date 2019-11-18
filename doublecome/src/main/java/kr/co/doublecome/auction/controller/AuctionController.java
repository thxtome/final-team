package kr.co.doublecome.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.auction.service.AuctionServiceImpl;

@Controller("kr.co.doublecome.auction.controller")
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	private AuctionServiceImpl service;
	
	@RequestMapping("/insertAuction.do")
	public void auctionInsert() {}
	
	@RequestMapping("/searchAuction.do")
	public void auctionSearch(Model model) {
		model.addAttribute("category",service.listCategory());
	}
	
}
