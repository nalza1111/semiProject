package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;

public class BoardSelect implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시판 상세보기 하는 곳.
		BoardService dao=new BoardServiceImpl();
		BoardVO vo=new BoardVO();
		vo.setBoardNumber(Integer.parseInt(request.getParameter("number")));	
		vo.setBoardTitle(request.getParameter("title"));
		vo.setBoardContent(request.getParameter("content"));
		vo.setBoardWriter(request.getParameter("writer"));
		vo.setViewCnt(Integer.parseInt( request.getParameter("cnt")));
		vo.setCreateDate(request.getParameter("date"));
		dao.boardSelect(vo);
		request.setAttribute("board",vo);
		return "board/boardSelectForm.tiles";
	}

}
