package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;

public class BoardUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시물 수정 기능
		HttpSession session=request.getSession();
		BoardVO vo = new BoardVO();
		BoardService dao = new BoardServiceImpl();	
		vo.setBoardNumber(Integer.parseInt(session.getAttribute("number").toString()));
		vo.setBoardTitle(request.getParameter("title"));
		vo.setBoardContent(request.getParameter("content"));
		vo.setBoardWriter((String)session.getAttribute("name"));
		int n = dao.boardUpdate(vo);
		System.out.println(n);
		String message = "입력이 실패 했습니다.";
		if (n > 0) {
			message = "정상적 처리가 이루어 졌습니다.";
		}
		request.setAttribute("message", message);
		session.removeAttribute("number");
		return "board/boardLogin.tiles";
	}
}
