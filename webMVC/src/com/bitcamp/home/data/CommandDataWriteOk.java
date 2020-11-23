package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class CommandDataWriteOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//파일업로드 , 데이터를 request
		//cos.jar 에있는  MultipartRequest 클래스가 파일업로드 , 데이터를 request 한다.
		
		//1. request 객체
		//2. 업로드할 위치(절대주소)
		String path = req.getServletContext().getRealPath("/upload");
		System.out.println("업로드할 절대주소 : "+path);
		//3.업로드할 파일의 최대크기  1024byte = 1K  1024*1024*1024 =1GB  
		int maxSize = 1024*1024*1024;
		//4. 한글 인코딩 코드
		//5. 같은 파일명이 존재시 파일명변경
		DefaultFileRenamePolicy pol = new DefaultFileRenamePolicy();
		//											1,   2,   3    ,   4  ,  5
		MultipartRequest mr = new MultipartRequest(req,path,maxSize,"UTF-8",pol);
		
		//폼의 정보를 vo에 담기
		DataVO vo = new DataVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		
		HttpSession session = req.getSession();
		vo.setUserid((String)session.getAttribute("logId"));
		vo.setIp(req.getRemoteAddr());
		
		// 업로드 파일명 
		int idx =0;
		String fileName[] = new String[2];
		
		//MultipartRequest 객체 mr 에서 사용자가 선택한 원래 파일목록 구하기
		Enumeration fileList = mr.getFileNames();
		
		while(fileList.hasMoreElements()) {
			String oldFileName = (String)fileList.nextElement();
			String newFileName = mr.getFilesystemName(oldFileName); //새로운 파일명
			System.out.println(oldFileName +"-->"+ newFileName);
			if(newFileName != null) {
				fileName[idx++] = newFileName;
			}
		}
		vo.setFilename(fileName);
		
		DataDAO dao = new DataDAO();
		int result = dao.dataInsert(vo);
		
		//레코드 추가 실패시 이미 업로드된 파일을 삭제한다
		if(result <= 0) {
			for(String delFile : fileName) {
				if(delFile !=null) {
					File file = new File(path , delFile);
					file.delete();
				} 
			}
		}
		req.setAttribute("result", result);
		return "/data/dataWriteOk.jsp";
	}

}
