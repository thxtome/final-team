package kr.co.doublecome.common.service;

import javax.servlet.http.HttpServletResponse;

import kr.co.doublecome.repository.vo.UtilFile;

public interface FileService {

	public UtilFile uploadFile(UtilFile uFile);
	public void downLoadFile(int fileNo, HttpServletResponse res);
	public void tempFile(String root, HttpServletResponse res);
}
