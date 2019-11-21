package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Report;
import kr.co.doublecome.repository.vo.SearchAuction;
import kr.co.doublecome.repository.vo.SearchUser;
import kr.co.doublecome.repository.vo.User;

public interface AdminMapper {
	public List<User> selectUserForAdmin(SearchUser su);
	public List<Auction> selectAuctionForAdmin(SearchAuction sa);
	public List<Report> selectReportByUserEmail(SearchUser su);
	public void deleteUser(List<String> userEmails);
}
