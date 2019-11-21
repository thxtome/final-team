package kr.co.doublecome.admin.service;

import kr.co.doublecome.repository.vo.AjaxPage;
import kr.co.doublecome.repository.vo.Page;
import kr.co.doublecome.repository.vo.SearchUser;

public interface AdminService {
	public AjaxPage retrieveUserForAdmin(SearchUser su);
	public AjaxPage retrieveReport(SearchUser su);
}
