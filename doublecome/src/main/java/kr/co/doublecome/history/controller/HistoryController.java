package kr.co.doublecome.history.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.doublecome.history.controller")
@RequestMapping("/history")
public class HistoryController {
	@RequestMapping("/listHistory.do")
	public void listHistory() {}
	
	@RequestMapping("/retrieveReview.do")
	public void retrieveReview() {}
	
	@RequestMapping("/editReview.do")
	public void editReview() {}
}
