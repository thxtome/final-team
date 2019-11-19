package kr.co.doublecome.admin.service;

import java.util.List;

import kr.co.doublecome.repository.vo.SearchUser;
import kr.co.doublecome.repository.vo.User;

public interface AdminService {
	public List<User> retrieveUserForAdmin(SearchUser su);
}
