package kr.co.doublecome.admin.service;

import java.util.List;

import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.SearchAuction;
import kr.co.doublecome.repository.vo.SearchUser;

public interface AdminService {
	public AjaxPage retrieveUserForAdmin(SearchUser su);
	public AjaxPage retrieveAuctionForAdmin(SearchAuction sa);
	public AjaxPage retrieveReport(SearchUser su);
	public void removeUser (List<String> userEmails);
	public AjaxPage retrieveCategories(Search search);
	public List<Category> retrieveCategoryForAucion();
	public void editCategory(Category cat);
	public void addCategory(Category cat);
}
