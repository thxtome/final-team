package kr.co.doublecome.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.main.service.MainService;

@Controller("kr.co.doublecome.main.controller.MainController")
public class MainController {
	@Autowired
	private MainService service;
	
	@RequestMapping("/main.do")
	public void main(Model model) {
		model.addAttribute("category", service.listCategory());
		model.addAttribute("auclist", service.mainList());
	}
}
