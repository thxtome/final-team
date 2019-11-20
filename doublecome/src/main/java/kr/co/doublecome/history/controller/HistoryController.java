package kr.co.doublecome.history.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.history.service.HistoryService;
import kr.co.doublecome.repository.vo.Review;

@Controller("kr.co.doublecome.history.controller.HistoryController")
@RequestMapping("/history")
public class HistoryController {
	@Autowired
	private HistoryService service;
	
	@RequestMapping("/listHistory.do")
	public void listHistory(String userEmail, Model model) {
		model.addAttribute("receiveReview", service.receiveReviewList(userEmail));
		model.addAttribute("sendReview", service.sendReviewList(userEmail));
		model.addAttribute("userHistory", service.receiveUserInfo(userEmail));
		model.addAttribute("saleHistory", service.receiveSaleHistory(userEmail));
		model.addAttribute("buyHistory", service.receiveBuyHistory(userEmail));
	}
	
	@RequestMapping("/addReview.do")
	public String addReview(Review review, Model model) {
		System.out.println(review);
		return "redirect:listHistory.do";
	}
	
	@RequestMapping("/editReview.do")
	public void editReview() {}
}
