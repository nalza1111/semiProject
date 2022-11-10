package co.bootjava.palette.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;

public class BoardList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시물목록 가져오기
		BoardService dao=new BoardServiceImpl();
		List<BoardVO> boards=new ArrayList<BoardVO>();
		boards=dao.boardSelectList();
		request.setAttribute("boards", boards);
		return "board/boardList.tiles";
	}

}
