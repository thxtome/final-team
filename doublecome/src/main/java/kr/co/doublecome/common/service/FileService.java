package kr.co.doublecome.common.service;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import kr.co.doublecome.repository.vo.UtilFile;

public interface FileService {

	public UtilFile uploadFile(UtilFile uFile);
	public UtilFile uploadProfile(UtilFile util, String email);
	public void downLoadFile(int fileNo, HttpServletResponse res);
	public void tempFile(String root, HttpServletResponse res);
}
