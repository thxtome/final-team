package kr.co.doublecome.auction.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.AuctionDetailMapper;
import kr.co.doublecome.repository.mapper.AuctionMapper;
import kr.co.doublecome.repository.mapper.HistoryMapper;
import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.History;
import kr.co.doublecome.repository.vo.Inquiry;
import kr.co.doublecome.repository.vo.Review;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.UtilFile;
import kr.co.doublecome.util.page.PageResult;

@Service("kr.co.doublecome.auction.service.AucitonDetailServiceImpl")
public class AucitonDetailServiceImpl implements AuctionDetailService {
	
	@Autowired
	private AuctionDetailMapper mapper;
	
	@Autowired 
	private HistoryMapper hMapper;
	
	@Autowired
	private AuctionMapper aMapper;
	
	public Auction auctiondetail(int no) {
		return mapper.auctiondetail(no);
	}
	
	public History userInfo(String userEmail) {
		return hMapper.userInfo(userEmail);
	}
	
	public List<Review> selectReceiveReview(String userEmail) {
		return hMapper.selectReceiveReview(userEmail);
	}
	
	public AjaxPage retrieveinquiry(int no) {
		AjaxPage ap = new AjaxPage();
		Search search = new Search();
		search.setKeyword(String.valueOf(no));	
		List<Object> list = new ArrayList<Object>();
		
		for(Auction auction : mapper.retrieveinquiry(search)) {
			list.add(auction);
		}
		int count = 0;
		
		if(!list.isEmpty()) {
			Auction a = (Auction)list.get(0);
			count = a.getAuctionCnt();
		}
		
		PageResult pr =  new PageResult(search.getPageNo(),count);
		ap.setList(list);
		ap.setPr(pr);
		return ap;
	}
	
	public void insertInquiry(Inquiry inquiry) {
		mapper.insertInquiry(inquiry);
	}
	
	public List<Category> categoryList() {
		return aMapper.categoryList();
	}
	
	public void addFile(UtilFile file) {
		mapper.addFile(file);
	}
	
	public int maxFileGroupCode() {
		return mapper.maxFileGroupCode();
	}
	
	public void addAuction(Auction auction) {
		mapper.addAuction(auction);
	}
	
	public List<UtilFile> retrieveFile(int no) {
		return mapper.retrieveFile(no);
	}
}
