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
	
	@RequestMapping("/listHistory.do")
	public void listHistory(Principal p, Model model) {
//		System.out.println(userEmail);
		String userEmail = p.getName();
//		InfinitePage ip = new InfinitePage();
//		ip.setBegin(0);
//		ip.setUserEmail(userEmail);
//		model.addAttribute("receiveReview", service.receiveReviewList(userEmail));
//		model.addAttribute("sendReview", service.sendReviewList(ip));
		model.addAttribute("userHistory", service.receiveUserInfo(userEmail));
		model.addAttribute("saleHistory", service.receiveSaleHistory(userEmail));
		model.addAttribute("buyHistory", service.receiveBuyHistory(userEmail));
	}
	
	@RequestMapping("/retrieveReceiveReview.do")
	@ResponseBody
	public List<Review> retrieveReceiveReview(InfinitePage ip, Principal p){
		System.out.println("에이작스 도착");
		System.out.println("ip");
		ip.setUserEmail(p.getName());
		System.out.println(service.receiveReviewList(ip));
		return service.receiveReviewList(ip);
	}
	
	@RequestMapping("/retrieveSendReview.do")
	@ResponseBody
	public List<Review> retrieveSendReview(InfinitePage ip, Principal p){
		System.out.println("에이작스 도착");
		System.out.println("ip");
		ip.setUserEmail(p.getName());
		System.out.println(service.sendReviewList(ip));
		return service.sendReviewList(ip);
	}
	
	@RequestMapping("/addReview.do")
	public String addReview(Principal p, Review review) {
		review.setReviewSender(p.getName());
		System.out.println(review);
		service.addReview(review);
		
		return "redirect:listHistory.do";
	}
	
	@RequestMapping("/editReview.do")
	public void editReview() {}
	
	@RequestMapping("/fileUpload.do")
	@ResponseBody
	public void AjaxFileUpload(UtilFile uFile) {
		fileService.uploadFile(uFile);
//		return fileService.uploadFile(uFile).getFilePath();
	}
	
	
}
