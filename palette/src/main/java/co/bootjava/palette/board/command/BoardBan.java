package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.common.Command;

public class BoardBan implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//게시물 신고를 누르면 Account 쪽 신고횟수가 증가
		AccountVO vo=new AccountVO();
		BoardService dao=new BoardServiceImpl();
		vo.setId(request.getParameter("userId"));
		int n=dao.boardBan(vo);
		String message = "입력이 실패 했습니다.";
		if (n > 0) {
			message = "정상적 처리가 이루어 졌습니다.";
		}
		request.setAttribute("message", message);
		return "board/boardLogin.tiles";
	}

}
