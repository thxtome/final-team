package kr.co.doublecome.auction.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.auction.service.AuctionDetailService;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Inquiry;
import kr.co.doublecome.repository.vo.UtilFile;
import kr.co.doublecome.util.file.FileUploadService;

@Controller("kr.co.doublecome.auction.controller.AuctionDetailController")
@RequestMapping("/auction")
public class AuctionDetailController {

	@Autowired
	private AuctionDetailService service;
	@Autowired
	private FileUploadService fileService;
	
	@RequestMapping("/detailAuction.do")
	public void auctionDetail(int no, String userEmail, Model model) {
		model.addAttribute("auction", service.auctiondetail(no));
		model.addAttribute("user", service.userInfo(userEmail));
		model.addAttribute("review", service.selectReceiveReview(userEmail));
		model.addAttribute("inquiry", service.retrieveinquiry(no));
		model.addAttribute("file", service.retrieveFile(no));
	}
	
	
	@RequestMapping("/insertAuction.do")
	public void auctionInsert(Model model) {
		model.addAttribute("category", service.categoryList());
	}
	
	@RequestMapping("/inquiry_add.do")
	public String insertInquiry(@RequestHeader(value="referer") String referer, Inquiry inquiry, Principal principal) {
		inquiry.setUserEmail(principal.getName());
		service.insertInquiry(inquiry);
		return "redirect:" + referer;
	}
	
	@RequestMapping("/addAuction.do")
	public String addAuction(@RequestHeader(value = "referer") String referer, Principal principal, Auction auction, UtilFile uFile) throws Exception {
		
		int groupCode = fileService.uploadFile(uFile);
		
		auction.setUserEmail(principal.getName());
		auction.setAuctionBuyNow(auction.getAuctionBuyNow().replaceAll(",", ""));
		auction.setAuctionMinPrice(auction.getAuctionMinPrice().replaceAll(",", ""));
		auction.setFileGroupCode(groupCode);
		service.addAuction(auction);
		
		return "redirect:/main.do";

	}
}
