package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;

public class BoardUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시물 수정 폼으로 연결
		BoardVO vo=new BoardVO();
		BoardService dao=new BoardServiceImpl();		
		vo.setBoardNumber(Integer.parseInt(request.getParameter("number")));
		BoardVO board=new BoardVO();
		board=dao.boardSelect(vo);
		request.setAttribute("board", board);		
		return "board/boardUpdateForm.tiles";
	}
}
