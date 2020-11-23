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
		//�α��� 
		RegisterVO vo = new RegisterVO();
		vo.setUserid(req.getParameter("userid"));
		vo.setUserpwd(req.getParameter("userpwd"));
		
		RegisterDAO dao = new RegisterDAO();
		dao.loginCheck(vo);
		
		//System.out.println(vo.getLogStatus());
		//�α��� ������ �������� ��� userid, username, logStatus
		if(vo.getLogStatus().equals("Y")) {
			HttpSession session = req.getSession();
			session.setAttribute("logid", vo.getUserid());
			session.setAttribute("logName", vo.getUsername());
			session.setAttribute("logStatus", vo.getLogStatus());		
		}
		return "/login/loginResult.jsp";
	}

}
