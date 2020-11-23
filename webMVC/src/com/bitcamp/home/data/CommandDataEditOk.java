package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CommandDataEditOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletContext().getRealPath("/upload");
		int maxSize = 1024*1024*1024;
		DefaultFileRenamePolicy pol = new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(req,path,maxSize,"UTF-8",pol);
		
		DataVO vo = new DataVO();
		
		vo.setNo(Integer.parseInt(mr.getParameter("no")));
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		
		//삭제한 파일명 리퀘스트해서 vo에 담기
		vo.setDelfile(mr.getParameterValues("delfile"));
		
		//새로 업로드한 파일명
		int idx = 0;
		String fileName[] = new String[2];
		Enumeration fileList =  mr.getFileNames();
		
		while(fileList.hasMoreElements()) {
			String old = (String)fileList.nextElement();
			String newFile = mr.getFilesystemName(old);
			if(newFile != null) { //삭제파일이 있는 경우
				fileName[idx++] = newFile;
			}
		}
		
		String[] del = vo.getDelfile();
		DataDAO dao = new DataDAO();
		
		if(idx<2) {  //이전 파일을 모두 대체한경우
			//데이터 베이스에 있는 원래 파일명 얻어오기
			String dbFile[] = dao.getFileName(vo.getNo());
			if(del != null) {
				for(String dbFilename:dbFile) {
					int chk= 0;
					for(String delFile:del) {

						if(dbFilename!=null && dbFilename.equals(delFile)) {
							chk++;
						}
					}
					if(chk==0) {
						fileName[idx++] = dbFilename;
					}
				}
			}else { //삭제한 파일이 없는경우
				for (String dbFilename:dbFile) {
					if(dbFilename != null) {
						fileName[idx++] = dbFilename;
					}
				}

			} // if del

		}

		vo.setFilename(fileName);
		int cnt = dao.dataUpdate(vo);
		
		if(cnt>0 && del !=null) {
		//이전 파일 삭제
			
			for(String d: del) {
				File f = new File(path , d);
				f.delete();
			}
		}
		req.setAttribute("cnt", cnt);
		req.setAttribute("no", vo.getNo());
		
		return "/data/dataEditOk.jsp";
	}

}
