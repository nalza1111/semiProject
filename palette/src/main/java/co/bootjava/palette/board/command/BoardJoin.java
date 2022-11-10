package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;

public class BoardJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글등록
		BoardService dao=new BoardServiceImpl();
		BoardVO vo=new BoardVO();
		vo.setBoardTitle(request.getParameter("title"));
		vo.setBoardContent(request.getParameter("content"))	;
		int n=dao.boardInsert(vo);
		String message="입력이 실패 했습니다.";
		if(n>0) {
			message="정상적 처리가 이루어 졌습니다.";
		}
		request.setAttribute("message", message);
				
		return "board/boardLogin.tiles";
	}

}
