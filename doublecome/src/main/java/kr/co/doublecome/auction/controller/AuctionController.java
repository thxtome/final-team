package kr.co.doublecome.auction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.doublecome.auction.controller")
@RequestMapping("/auction")
public class AuctionController {

	@RequestMapping("/detailAuction.do")
	public void auctionDetail() {}

	@RequestMapping("/insertAuction.do")
	public void auctionInsert() {}
	
}
