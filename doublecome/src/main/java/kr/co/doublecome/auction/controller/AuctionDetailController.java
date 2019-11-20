package kr.co.doublecome.auction.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.auction.service.AuctionDetailService;
import kr.co.doublecome.repository.vo.Inquiry;

@Controller("kr.co.doublecome.auction.controller.AuctionDetailController")
@RequestMapping("/auction")
public class AuctionDetailController {

	@Autowired
	private AuctionDetailService service;
	
	@RequestMapping("/detailAuction.do")
	public void auctionDetail(int no, String userEmail, Model model) {
		model.addAttribute("auction", service.auctiondetail(no));
		model.addAttribute("user", service.userInfo(userEmail));
		model.addAttribute("review", service.selectReceiveReview(userEmail));
		model.addAttribute("inquiry", service.retrieveinquiry(no));
	}
	
	@RequestMapping("/inquiry_add.do")
	public String insertInquiry(@RequestHeader(value="referer") String referer, Inquiry inquiry, Principal principal) {
		inquiry.setUserEmail(principal.getName());
		service.insertInquiry(inquiry);
		return "redirect:" + referer;
	}
	
}
