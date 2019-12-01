package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.Deal;
import kr.co.doublecome.repository.vo.Report;
import kr.co.doublecome.repository.vo.ReportType;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.SearchAuction;
import kr.co.doublecome.repository.vo.SearchDeal;
import kr.co.doublecome.repository.vo.SearchUser;
import kr.co.doublecome.repository.vo.User;

public interface AdminMapper {
	public List<User> selectUserForAdmin(SearchUser su);
	public List<Auction> selectAuctionForAdmin(SearchAuction sa);
	public List<Report> selectReportForAdmin(Search search);
	public void deleteUser(List<String> userEmails);
	public List<Category> selectCategoriesForAdmin(Search search);
	public void updateCategory(Category cat);
	public void insertCategory(Category cat);
	public void deleteCategory(List<String> categoryCodes);
	public void deleteAuction(List<Integer> auctionNos);
	public List<Deal> selectDealForAdmin(SearchDeal sd);
	public void updateReportType(ReportType reportType);
	public void insertReportType(ReportType reportType);
	public List<ReportType> selectReportTypesForAdmin(Search search);
	public void deleteReportType(List<String> reportTypeCodes);
}
