package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Deal;
import kr.co.doublecome.repository.vo.Inquiry;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.UtilFile;

public interface AuctionDetailMapper {
	
	Auction auctiondetail(int no);
	List<Inquiry> retrieveinquiry(Search search);
	void insertInquiry(Inquiry inquiry);
	int addFile(UtilFile file);
	int maxFileGroupCode();
	void addAuction(Auction auction);
	List<UtilFile> retrieveFile(int no);
	void deleteAuction(int no);
	void updateInquiry(Inquiry inquiry);
	void deleteInquiry(int no);
	void auctionBid(Auction auction);
	void insertDeal(Deal deal);
	void auctionCondition(int no);
	int checkBid(Auction auction);
}
