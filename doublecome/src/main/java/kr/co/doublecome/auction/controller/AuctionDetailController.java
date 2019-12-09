package kr.co.doublecome.auction.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.auction.service.AuctionDetailService;
import kr.co.doublecome.common.service.FileService;
import kr.co.doublecome.common.service.SmsService;
import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Inquiry;
import kr.co.doublecome.repository.vo.Review;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.UtilFile;

@Controller("kr.co.doublecome.auction.controller.AuctionDetailController")
@RequestMapping("/auction")
public class AuctionDetailController {

	@Autowired
	private AuctionDetailService service;
	@Autowired
	private FileService fileService;
//	@Autowired
//	private HistoryService hService;
	@Autowired
	private SmsService smsService;
	
	@RequestMapping("/detailAuction.do")
	public void auctionDetail(int no, String userEmail, Model model, Integer pageNo, Search search ) {
		model.addAttribute("auction", service.auctiondetail(no));
		model.addAttribute("user", service.userInfo(userEmail));
		search.setKeyword("c@c");
		search.setPageNo(1);
		search.setListSize(2);
		model.addAttribute("review", service.selectReceiveReview(search));
		AjaxPage ap = service.retrieveinquiry(no, pageNo);
		model.addAttribute("inquiry", ap.getList());
		model.addAttribute("pr", ap.getPr());
		model.addAttribute("file", service.retrieveFile(no));
		model.addAttribute("bid", service.bidList(no));
	}
	
	@RequestMapping("/retrieveReceiveReview.do")
	@ResponseBody
	public List<Review> retrieveReceiveReview(Search search, int rPageNo, String email){
		search.setKeyword(email);
		search.setListSize(5);
		search.setPageNo(rPageNo);
		return service.selectReceiveReview(search);
	}
	
	@RequestMapping("/checkBid.do")
	@ResponseBody
	public int checkBid(Auction auction){
		int result = service.checkBid(auction);
		if (result >= 1) {
			return 1;
		}
		return 0;
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
		
		int groupCode = fileService.uploadFile(uFile).getFileGroupCode();
		
		auction.setUserEmail(principal.getName());
		auction.setAuctionBuyNow(auction.getAuctionBuyNow().replaceAll(",", ""));
		auction.setAuctionMinPrice(auction.getAuctionMinPrice().replaceAll(",", ""));
		auction.setFileGroupCode(groupCode);
		service.addAuction(auction);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping("/deleteAuction.do")
	public String updateAuction(int no, Model model) {
		service.deleteAuction(no);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/editInquiry.do")
	public String updateInquiry(@RequestHeader(value="referer") String referer, Inquiry inquiry) {
		service.updateInquiry(inquiry);
		return "redirect:" + referer;
	}
	@RequestMapping("/removeInquiry.do")
	public String deleteInquiry(@RequestHeader(value="referer") String referer, int inquiryNo) {
		service.deleteInquiry(inquiryNo);
		return "redirect:" + referer;
	}
	@RequestMapping("/addBid.do")
	public String auctionBid(@RequestHeader(value="referer") String referer, Principal principal, Auction auction) {
		auction.setUserEmail(principal.getName());
		smsService.sendSMS("최고입찰가가 갱신되었습니다.", service.selectPhNum(auction.getAuctionNo()));
		service.auctionBid(auction);
		return "redirect:" + referer;
	}
	@RequestMapping("/buyNow.do")
	public String insertDeal(Principal principal, Auction auction) {
		auction.setUserEmailBuyer(principal.getName());
		service.callSPAddDeal(auction);
		return "redirect:/main.do";
	}
	
}
