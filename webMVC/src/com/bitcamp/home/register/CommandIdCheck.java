package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;
import com.bitcamp.home.DBConnection;

public class CommandIdCheck extends RegisterDAO implements CommandService {

	@Override 
	public void registerSelect(RegisterVO vo) {
		
	}
	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//���� �Էµ� ���̵� DB��ȸ�Ѵ�.
		String userid = req.getParameter("userid");
		
		RegisterDAO dao = new RegisterDAO();
		
		int cnt = dao.idSearch(userid);
		//view�� �ʿ��� ������ ������
		req.setAttribute("userid", userid);
		req.setAttribute("result", cnt);
		
		return "/register/idSearch.jsp";
	}
	

}
