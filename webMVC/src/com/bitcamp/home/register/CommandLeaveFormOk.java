package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandLeaveFormOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//1.비밀번호 리퀘스트
		String userpwd = req.getParameter("userpwd");
		
		//2.세션에서 로그인한 아이디
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("logId");
		RegisterDAO dao = RegisterDAO.getInstance();
		
		int result = dao.regLeaveRecord(userid, userpwd);
				
		if(result>0) { //탈퇴성공시 세션제거하기
			ses.invalidate();
		}
		req.setAttribute("result", result);
		return "regLeaveResult.jsp";
	}

}
