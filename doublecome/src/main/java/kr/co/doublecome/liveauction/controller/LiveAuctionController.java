package kr.co.doublecome.liveauction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.liveauction.service.LiveAuctionService;

@Controller
@RequestMapping("/liveAuction")
public class LiveAuctionController {
	
	@Autowired
	LiveAuctionService service;
	

	@RequestMapping("/main.do")
	public void main() {}

	
}
