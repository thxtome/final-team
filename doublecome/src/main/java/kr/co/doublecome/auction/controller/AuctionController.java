package kr.co.doublecome.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.auction.service.AuctionService;

@Controller("kr.co.doublecome.auction.controller")
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	private AuctionService service;
	
	@RequestMapping("/detailAuction.do")
	public void auctionDetail() {}

	@RequestMapping("/insertAuction.do")
	public void auctionInsert() {}
	
	@RequestMapping("/searchAuction.do")
	public void auctionSearch(Model model) {
		model.addAttribute("category",service.listCategory());
	}
	
}
