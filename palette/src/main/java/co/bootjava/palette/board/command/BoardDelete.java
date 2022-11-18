package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;

public class BoardDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시글 삭제기능
		BoardVO vo = new BoardVO();
		BoardService dao = new BoardServiceImpl();
		System.out.println(request.getParameter("number"));
		vo.setBoardNumber(Integer.parseInt(request.getParameter("number")));
		int n = dao.boardDelete(vo);
		String message = "입력이 실패 했습니다.";
		if (n > 0) {
			message = "정상적 처리가 이루어 졌습니다.";
		}
		request.setAttribute("message", message);
		return "board/boardLogin.tiles";
	}

}
