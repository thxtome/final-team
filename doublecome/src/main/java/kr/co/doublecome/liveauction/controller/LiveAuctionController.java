package kr.co.doublecome.liveauction.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.liveauction.service.LiveAuctionService;

@Controller
@RequestMapping("/liveAuction")
public class LiveAuctionController {
	
	@Autowired
	LiveAuctionService service;
	

	@RequestMapping("/main.do")
	public void main(int auctionNo, HttpSession session, Model model) {
		session.setAttribute("auctionNo", auctionNo);
		model.addAttribute("auction",service.retrieveAuction(auctionNo));
	}

	
}
