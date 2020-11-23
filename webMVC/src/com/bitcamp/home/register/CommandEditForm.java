package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandEditForm implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//ȸ������
		//session�α��� �� id�� ���ؼ� db���� ȸ�������� �����Ѵ�.
		HttpSession session = req.getSession();
		
		RegisterVO vo = new RegisterVO();
		vo.setUserid((String)session.getAttribute("logId"));
		
		
		RegisterDAO dao = new RegisterDAO();
		dao.registerSelect(vo);
		req.setAttribute("regVO", vo);
		
		return"/register/regEditForm.jsp";
	}

}
