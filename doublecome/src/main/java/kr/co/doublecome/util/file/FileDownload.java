package kr.co.doublecome.util.file;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.doublecome.auction.service.AucitonDetailServiceImpl;
import kr.co.doublecome.repository.vo.UtilFile;

@Controller
@RequestMapping("/file")
public class FileDownload {

	@Autowired
	private AucitonDetailServiceImpl service;
	
	@RequestMapping("/upload.do")
	public int upload(UtilFile uFile) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");
		String filePath = "/auction" + sdf.format(new Date());
		int groupCode = service.maxFileGroupCode() + 1;
		for (MultipartFile mFile : uFile.getAttach()) {
			if (mFile.isEmpty()) continue;
			
			String orgName = mFile.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			String sysName = UUID.randomUUID().toString() + ext;
			File file = new File("c:/java/upload" + filePath + sysName);
			if(file.exists() == false) file.mkdirs();
			mFile.transferTo(file);
			uFile.setFileGroupCode(groupCode);
			uFile.setFileOriginName(orgName);
			uFile.setFileSystemName(sysName);
			uFile.setFilePath("c:/java/upload" + filePath);
			service.addFile(uFile);
		}
		return groupCode;
	}
	
	@RequestMapping("/imgLoad.do")
	public void imgLoad(UtilFile f, HttpServletResponse res) throws Exception {
		
		String fileDir = f.getFilePath();
		String fileName = f.getFileSystemName();
		String path = "C:\\java\\upload" + "\\" + fileDir;
		File file = new File(path, fileName);
		
        res.setHeader("Content-Length", String.valueOf(file.length()));
        res.setHeader("Content-Disposition", "inline;");
        Files.copy(file.toPath(), res.getOutputStream());
	}
}
