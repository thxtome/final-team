package kr.co.doublecome.repository.mapper;

import kr.co.doublecome.repository.vo.UtilFile;

public interface FileMapper {
	public UtilFile selectOneFile(int fileNo);
	public int addFile(UtilFile file);
	public void addProfile(UtilFile file);
	public int maxFileGroupCode();
}
