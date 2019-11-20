package kr.co.doublecome.util.file;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import kr.co.doublecome.repository.vo.UtilFile;

@Controller
@RequestMapping("/file")
public class FileUpload {

	public void folderMake() {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String filePath = "/auction" + sdf.format(new Date());
		File file = new File("c:/java/upload" + filePath);
		if(file.exists() == false) file.mkdirs();
	}
	
	@RequestMapping("/upload.do")
	public String upload02(List<MultipartFile> attach) throws Exception {
		System.out.println("attach.size() : " + attach.size());
		for (MultipartFile file : attach) {
			if (file.isEmpty()) continue;
			
			String orgName = file.getOriginalFilename();
			long size = file.getSize();
			System.out.println("파일명 : " + orgName);
			System.out.println("파일크기 : " + size);
			file.transferTo(new File("c:/java/upload/" + orgName));
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
