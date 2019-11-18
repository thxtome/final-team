package kr.co.doublecome.util.file;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file")
public class FileUpload {

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
}
