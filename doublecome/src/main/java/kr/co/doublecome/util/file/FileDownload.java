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
	
	@RequestMapping("/imgLoad.do")
	public void imgLoad(UtilFile f, HttpServletResponse res) throws Exception {
		
		String fileDir = f.getFilePath();
		String fileName = f.getFileSystemName();
		File file = new File(fileDir, fileName);
		
        res.setHeader("Content-Length", String.valueOf(file.length()));
        res.setHeader("Content-Disposition", "inline;");
        Files.copy(file.toPath(), res.getOutputStream());
	}
}
