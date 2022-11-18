package co.bootjava.palette.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;

public class MyBoardList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//나의 게시물목록 가져오기
		BoardService dao=new BoardServiceImpl();
		BoardVO vo=new BoardVO();
		List<BoardVO> boards=new ArrayList<BoardVO>();
		HttpSession session=request.getSession();
		vo.setUserId((String) session.getAttribute("id"));
		boards=dao.myBoardList(vo);
		System.out.println(boards);
		request.setAttribute("boards", boards);
		
		return "board/myBoardList.tiles";
	}
}
