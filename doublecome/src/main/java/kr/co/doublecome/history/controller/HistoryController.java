package kr.co.doublecome.history.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.history.service.HistoryService;
import kr.co.doublecome.repository.vo.InfinitePage;
import kr.co.doublecome.repository.vo.Review;
import kr.co.doublecome.repository.vo.UtilFile;
import kr.co.doublecome.util.file.FileUploadService;

@Controller("kr.co.doublecome.history.controller.HistoryController")
@RequestMapping("/history")
public class HistoryController {
	@Autowired
	private HistoryService service;
	@Autowired
	private FileUploadService fileService;
	
	// history 처음 로딩시 구매/판매 내역, 후기 목록
	@RequestMapping("/listHistory.do")
	public void listHistory(Principal p, Model model) {
		String userEmail = p.getName();
		model.addAttribute("userHistory", service.receiveUserInfo(userEmail));
		model.addAttribute("saleHistory", service.receiveSaleHistory(userEmail));
		model.addAttribute("buyHistory", service.receiveBuyHistory(userEmail));
	}
	
	// 받은 후기 ajax
	@RequestMapping("/retrieveReceiveReview.do")
	@ResponseBody
	public List<Review> retrieveReceiveReview(InfinitePage ip, Principal p){
		ip.setUserEmail(p.getName());
		return service.receiveReviewList(ip);
	}
	
	// 보낸후기 ajax
	@RequestMapping("/retrieveSendReview.do")
	@ResponseBody
	public List<Review> retrieveSendReview(InfinitePage ip, Principal p){
		ip.setUserEmail(p.getName());
		System.out.println(ip.getSearch());
		return service.sendReviewList(ip);
	}
	
	// 후기등록
	@RequestMapping("/addReview.do")
	public String addReview(Principal p, Review review) {
		review.setReviewSender(p.getName());
		service.insertReview(review);
		
		return "redirect:listHistory.do";
	}
	
	// 후기 수정
	@RequestMapping("/editReview.do")
	public void editReview() {}
	
	// 후기삭제
	@RequestMapping("/removeReview.do")
	public String removeReview(Review review) {
		service.deleteReview(review);
		return "redirect:listHistory.do";
	}
	
	@RequestMapping("/fileUpload.do")
	@ResponseBody
	public void AjaxFileUpload(UtilFile uFile) {
		fileService.uploadFile(uFile);
//		return fileService.uploadFile(uFile).getFilePath();
	}
	
	
}
