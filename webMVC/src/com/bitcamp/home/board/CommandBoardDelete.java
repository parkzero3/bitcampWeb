package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandBoardDelete implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
/*		
		PagingVO pVo = new PagingVO();
		
		pVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		
		if(req.getParameter("searchWord")!=null) {
			pVo.setSearchKey(req.getParameter("searchKey"));
			pVo.setSearchWord(req.getParameter("searchWord"));
		}
		BoardVO vo = new BoardVO();
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardDelete(vo.getNo());
		
		req.setAttribute("no", vo.getNo());
		req.setAttribute("pVo", pVo);
		req.setAttribute("cnt", cnt);
		
*/
		int no = Integer.parseInt(req.getParameter("no"));
		
		//페이지번호 , 검색키 , 검색어
		PagingVO pVo = new PagingVO();
		pVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		String searchWordStr = req.getParameter("searchWord");
		if(searchWordStr != null) {
			pVo.setSearchKey(req.getParameter("searchKey"));
			pVo.setSearchWord(req.getParameter(searchWordStr));
		}
		
		BoardDAO dao = new BoardDAO();
		int result = dao.boardDelete(no);
		
		//req.setAttribute("no", no);
		req.setAttribute("pVo", pVo);
		req.setAttribute("result", result);
		
		return "/board/boardDeleteOk.jsp";
	}

}
















