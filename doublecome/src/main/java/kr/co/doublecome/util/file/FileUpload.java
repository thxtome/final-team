package kr.co.doublecome.util.file;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import kr.co.doublecome.repository.vo.UtilFile;

@Controller
@RequestMapping("/file")
public class FileUpload {

	public void folderMake() {
	}
	
	@RequestMapping("/upload.do")
	public String upload02(UtilFile uFile) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");
		String filePath = "/auction" + sdf.format(new Date());
		for (MultipartFile mFile : uFile.getAttach()) {
			if (mFile.isEmpty()) continue;
			
			String orgName = mFile.getOriginalFilename();
			long size = mFile.getSize();
			System.out.println("파일명 : " + orgName);
			System.out.println("파일크기 : " + size);
			File file = new File("c:/java/upload" + filePath + orgName);
			if(file.exists() == false) file.mkdirs();
			mFile.transferTo(file);
		}
		return "redirect:/main.do";
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
