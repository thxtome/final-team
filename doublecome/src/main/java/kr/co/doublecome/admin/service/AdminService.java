package kr.co.doublecome.admin.service;

import java.util.List;

import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.SearchAuction;
import kr.co.doublecome.repository.vo.SearchUser;

public interface AdminService {
	public AjaxPage retrieveUserForAdmin(SearchUser su);
	public AjaxPage retrieveAuctionForAdmin(SearchAuction sa);
	public AjaxPage retrieveReport(SearchUser su);
	public void removeUser (List<String> userEmails);
	public List<Category> retrieveCategories(); 
}
