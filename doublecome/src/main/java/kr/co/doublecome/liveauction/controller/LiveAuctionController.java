package kr.co.doublecome.liveauction.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.liveauction.service.LiveAuctionService;
import kr.co.doublecome.repository.vo.Auction;

@Controller
@RequestMapping("/liveAuction")
public class LiveAuctionController {
	
	@Autowired
	LiveAuctionService service;
	

	@RequestMapping("/main.do")
	public String main(int auctionNo, HttpSession session, Model model) {
		Auction auction = service.retrieveAuction(auctionNo);
		if(auction.getAuctionBroadcast() == 1) {
			return "liveAuction/notExist";
		}
		session.setAttribute("auctionNo", auctionNo);
		model.addAttribute("auction",service.retrieveAuction(auctionNo));
		return "liveAuction/main";
	}
	
	@RequestMapping("/test.do")
	public void test() {}

	
}
