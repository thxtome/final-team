package kr.co.doublecome.history.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.history.service.HistoryService;
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
		String userEmail = p.getName();
		System.out.println(userEmail);
		model.addAttribute("receiveReview", service.receiveReviewList(userEmail));
		model.addAttribute("sendReview", service.sendReviewList(userEmail));
		model.addAttribute("userHistory", service.receiveUserInfo(userEmail));
		model.addAttribute("saleHistory", service.receiveSaleHistory(userEmail));
		model.addAttribute("buyHistory", service.receiveBuyHistory(userEmail));
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
