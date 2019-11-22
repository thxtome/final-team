package kr.co.doublecome.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.AdminMapper;
import kr.co.doublecome.repository.mapper.AuctionMapper;
import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.Report;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.SearchAuction;
import kr.co.doublecome.repository.vo.SearchUser;
import kr.co.doublecome.repository.vo.User;
import kr.co.doublecome.util.page.PageResult;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminMapper mapper;

	@Autowired
	AuctionMapper auctionMapper;
	
	public AjaxPage retrieveUserForAdmin(SearchUser su){
		AjaxPage ap = new AjaxPage();
		List<Object> list = new ArrayList<Object>();
		List<User> ulist = mapper.selectUserForAdmin(su);
		for(User user : ulist) {
			list.add((Object)user);
		}
		
		int count = 0;
		
		if(!ulist.isEmpty()) {
			count = ulist.get(0).getUserCnt();
		}
		
		ap.setList(list);
		ap.setPr(new PageResult(su.getPageNo(), count, su.getListSize(), 10));
		
		return ap;
	}

	
	public void editCategory(Category cat) {
		mapper.updateCategory(cat);
	}

	public void removeCategories(List<String> categoryCodes) {
		mapper.deleteCategory(categoryCodes);
	}


	@Override
	public void addCategory(Category cat) {
		mapper.insertCategory(cat);		
	}


	public AjaxPage retrieveReport(SearchUser su) {
		
		AjaxPage ap = new AjaxPage();
		List<Object> list = new ArrayList<Object>();
		System.out.println(su.getKeyword());
		List<Report> rlist = mapper.selectReportByUserEmail(su);
		
		for(Report report : rlist) {
			list.add((Object)report);
		}
		
		int count = 0;
		
		if(!rlist.isEmpty()) {
			count = rlist.get(0).getReportCnt();
		}
		
		ap.setList(list);
		ap.setPr(new PageResult(su.getPageNo(), count, 5, 5));

		return ap;
	}
	
	public void removeUser(List<String> userEmails) {
		mapper.deleteUser(userEmails);
	}
	
	public AjaxPage retrieveCategories(Search search){
		
		AjaxPage ap = new AjaxPage();
		List<Object> list = new ArrayList<Object>();
		List<Category> clist =  mapper.selectCategoriesForAdmin(search);
		
		
		for(Category cat : clist) {
			list.add((Object)cat);
		}
		
		int count = 0;
		
		if(!clist.isEmpty()) {
			count = clist.get(0).getCategoryCnt();
		}
		
		ap.setList(list);
		ap.setPr(new PageResult(search.getPageNo(), count, search.getListSize(), 10));
		
		return ap;
	}
	
	public List<Category> retrieveCategoryForAucion(){
		return auctionMapper.categoryList();
	}
	
	public AjaxPage retrieveAuctionForAdmin(SearchAuction sa){
		AjaxPage ap = new AjaxPage();
		List<Object> list = new ArrayList<Object>();
		List<Auction> alist = mapper.selectAuctionForAdmin(sa);
		
		System.out.println(alist);
		
		for(Auction auction : alist) {
			list.add((Object)auction);
		}
		
		int count = 0;
		
		if(!alist.isEmpty()) {
			count = alist.get(0).getAuctionCnt();
		}
		
		ap.setList(list);
		ap.setPr(new PageResult(sa.getPageNo(), count, sa.getListSize(), 10));
		
		return ap;
	}
}
