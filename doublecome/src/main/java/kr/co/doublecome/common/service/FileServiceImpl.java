package kr.co.doublecome.common.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.doublecome.repository.mapper.FileMapper;
import kr.co.doublecome.repository.vo.UtilFile;

@Service("kr.co.doublecome.common.service.FileServiceImpl")
public class FileServiceImpl implements FileService{

	@Autowired
	private FileMapper mapper;
	
	public UtilFile uploadFile(UtilFile uFile) {
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
		}
		return uFile;
	}
	
	public void downLoadFile(int fileNo, HttpServletResponse res) {
		try {
			System.out.println(fileNo);
			UtilFile uFile = mapper.selectOneFile(fileNo);
			System.out.println(uFile);
			File f = new File(uFile.getFilePath(), uFile.getFileSystemName());
			String orgName = uFile.getFileOriginName();
			if (orgName == null) {
				res.setHeader("Content-type", "image/jpg");
			} else {
				res.setHeader("Content-type", "application/octet-stream");
				orgName = new String(orgName.getBytes("utf-8"), "8859_1");
				res.setHeader("Content-Disposition", "attachment;filename=" + orgName);
			}

		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = res.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while (true) {
			int ch = bis.read();
			if (ch == -1)
				break;
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void tempFile(String root, HttpServletResponse res) {
		try {
			File f = new File(root);
			res.setHeader("Content-type", "image/jpg");
			FileInputStream fis = new FileInputStream(f);
			BufferedInputStream bis = new BufferedInputStream(fis);
			OutputStream out = res.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(out);
			while (true) {
				int ch = bis.read();
				if (ch == -1)
					break;
				bos.write(ch);
			}
			bis.close();
			fis.close();
			bos.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
