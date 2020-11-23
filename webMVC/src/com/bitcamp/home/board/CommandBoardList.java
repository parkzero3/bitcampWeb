package com.bitcamp.home.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandBoardList implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		PagingVO pageVO = new PagingVO();
		
		
		
		req.setAttribute("pageVO", pageVO);
		
		//현재페이지
		String nowPageTxt = req.getParameter("nowPage");
		if(nowPageTxt!=null) {
			pageVO.setNowPage(Integer.parseInt(nowPageTxt));
		}
		
		
		//검색어 검색키
		String sWord = req.getParameter("searchWord");
		if(!(sWord==null||sWord.equals(""))) {
			pageVO.setSearchKey(req.getParameter("searchKey"));
			pageVO.setSearchWord(sWord);
			//System.out.println("확인");
		}
		//총레코드 수
		pageVO.setTotalRecord(dao.getAllRecordCount(pageVO));
		
		List<BoardVO>list = dao.getListRecord(pageVO);
		req.setAttribute("pageVO", pageVO);
		req.setAttribute("list", list);
		return "/board/boardList.jsp";
	
	}
}
