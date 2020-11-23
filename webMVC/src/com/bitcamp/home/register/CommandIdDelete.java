package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandIdDelete implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		RegisterVO vo = new RegisterVO();
		vo.setUserid((String)session.getAttribute("logid"));
		
		RegisterDAO dao = new RegisterDAO();
		dao.registerDelete(vo);
		//req.setAttribute(, o);
		
		return "index.jsp";
	}

}
