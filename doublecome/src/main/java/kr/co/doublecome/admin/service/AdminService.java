package kr.co.doublecome.admin.service;

import java.util.List;

import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.ReportType;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.SearchAuction;
import kr.co.doublecome.repository.vo.SearchDeal;
import kr.co.doublecome.repository.vo.SearchUser;

public interface AdminService {
	public AjaxPage retrieveUserForAdmin(SearchUser su);
	public AjaxPage retrieveAuctionForAdmin(SearchAuction sa);
	public AjaxPage retrieveReport(Search search);
	public void removeUser (List<String> userEmails);
	public AjaxPage retrieveCategories(Search search);
	public List<Category> retrieveCategoryForAucion();
	public void editCategory(Category cat);
	public void addCategory(Category cat);
	public void removeCategories(List<String> categoryCodes);
	public void removeAuction(List<Integer> auctionNos);
	public AjaxPage retrieveDealForAdmin(SearchDeal sd);
	public void editReportType(ReportType reportType);
	public void addReportType(ReportType reportType);
	public AjaxPage retrieveReportTypes(Search search);
	public void removeReportTypes(List<String> reportTypeCodes);
}
