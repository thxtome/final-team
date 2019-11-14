package kr.co.doublecome.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.repository.mapper.MainMapper;
import kr.co.doublecome.repository.vo.Auction;

@Service("kr.co.doublecome.main.service.MainService")
public class MainService {
	
	@Autowired
	private MainMapper mapper;
	
	@RequestMapping("/main.do")
	public List<Auction> mainList() {
		return mapper.mainAuctionList();
	}
}
