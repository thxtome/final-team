package kr.co.doublecome.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.AdminMapper;
import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Page;
import kr.co.doublecome.repository.vo.Report;
import kr.co.doublecome.repository.vo.SearchUser;
import kr.co.doublecome.repository.vo.User;
import kr.co.doublecome.util.page.PageResult;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminMapper mapper;
	
	public AjaxPage retrieveUserForAdmin(SearchUser su){
		su.getKeyword();
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
}
