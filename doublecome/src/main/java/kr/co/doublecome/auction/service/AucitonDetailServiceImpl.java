package kr.co.doublecome.auction.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.doublecome.repository.mapper.AuctionDetailMapper;
import kr.co.doublecome.repository.mapper.AuctionMapper;
import kr.co.doublecome.repository.mapper.HistoryMapper;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.History;
import kr.co.doublecome.repository.vo.Inquiry;
import kr.co.doublecome.repository.vo.Review;
import kr.co.doublecome.repository.vo.UtilFile;

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
	
	public List<Auction> retrieveinquiry(int no) {
		return mapper.retrieveinquiry(no);
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
}
