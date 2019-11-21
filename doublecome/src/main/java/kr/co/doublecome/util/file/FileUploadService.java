package kr.co.doublecome.util.file;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.doublecome.auction.service.AucitonDetailServiceImpl;
import kr.co.doublecome.repository.mapper.AuctionDetailMapper;
import kr.co.doublecome.repository.vo.UtilFile;

@Service
public class FileUploadService {

	@Autowired
	private AuctionDetailMapper mapper;
	
	public UtilFile uploadFile(UtilFile uFile) {
		UtilFile utilFile = new UtilFile();
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");
		String filePath = "/auction" + sdf.format(new Date());
		int groupCode = mapper.maxFileGroupCode() + 1;
		for (MultipartFile mFile : uFile.getAttach()) {
			if (mFile.isEmpty()) continue;
			
			String orgName = mFile.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			String sysName = UUID.randomUUID().toString() + ext;
			File file = new File("c:/java/upload" + filePath + sysName);
			if(file.exists() == false) file.mkdirs();
			try {
				mFile.transferTo(file);
			} catch (Exception e) {
			}
			uFile.setFileGroupCode(groupCode);
			uFile.setFileOriginName(orgName);
			uFile.setFileSystemName(sysName);
			uFile.setFilePath("c:/java/upload" + filePath);
			mapper.addFile(uFile);
			utilFile.setFileGroupCode(groupCode);
			utilFile.setFilePath("c:/java/upload" + filePath);
		}
		return utilFile;
	}
	
}
