package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandFormOk implements CommandService {

	

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//���� �����͸� request �� ������ ��ü
		RegisterVO vo = new RegisterVO();
		vo.setUserid(req.getParameter("userid"));
		vo.setUserpwd(req.getParameter("userpwd"));
		vo.setUsername(req.getParameter("username"));
		vo.setGender(req.getParameter("gender"));
		
		
		//�������
		vo.setYear(req.getParameter("year"));
		vo.setMonth(req.getParameter("month"));
		vo.setDay(req.getParameter("day"));
		
		//��ȭ��ȣ
		vo.setTel1(req.getParameter("tel1"));
		vo.setTel2(req.getParameter("tel2"));
		vo.setTel3(req.getParameter("tel3"));
		
		vo.setEmail(req.getParameter("email"));
		vo.setZipcode(req.getParameter("zipcode"));
		vo.setAddr(req.getParameter("addr"));
		vo.setAddrDetail(req.getParameter("addrdetail"));
		
		RegisterDAO dao = new RegisterDAO();
		int result = dao.registerInsert(vo);
		
//		if(result==0) {//ȸ������ ����
//			return "/register/regFormResult.jsp";
//		}else {//ȸ������ ����
//			return "/register/index.jsp";
//		}
		req.setAttribute("result", result);
		
		System.out.println(result);
		return "/register/regFormResult.jsp";
	}

}
