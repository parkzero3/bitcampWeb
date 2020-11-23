package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandLoginOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//로그인 
		RegisterVO vo = new RegisterVO();
		vo.setUserid(req.getParameter("userid"));
		vo.setUserpwd(req.getParameter("userpwd"));
		
		RegisterDAO dao = new RegisterDAO();
		dao.loginCheck(vo);
		
		//System.out.println(vo.getLogStatus());
		//로그인 성공시 세션정보 기록 userid, username, logStatus
		if(vo.getLogStatus().equals("Y")) {
			HttpSession session = req.getSession();
			session.setAttribute("logid", vo.getUserid());
			session.setAttribute("logName", vo.getUsername());
			session.setAttribute("logStatus", vo.getLogStatus());		
		}
		return "/login/loginResult.jsp";
	}

}
