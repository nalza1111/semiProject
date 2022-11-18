package co.bootjava.palette.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;

public class BoardDetailList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//게시물 상세보기 기능
		BoardVO vo = new BoardVO();
		BoardService dao = new BoardServiceImpl();
		List<BoardVO> boards = new ArrayList<BoardVO>();
		String search = request.getParameter("search");
		if (search.equals("작성자")) {
			vo.setBoardWriter(request.getParameter("searchcontent"));
			vo.setBoardTitle("#########################");
			vo.setBoardContent("##########################");
		} else if (search.equals("글제목")) {
			vo.setBoardTitle(request.getParameter("searchcontent"));
			vo.setBoardContent("##########################");
			vo.setBoardWriter("###########################");
		} else if (search.equals("글내용")) {
			vo.setBoardContent(request.getParameter("searchcontent"));
			vo.setBoardTitle("#########################");
			vo.setBoardWriter("###########################");
		}
		boards = dao.boardDetailList(vo);
		System.out.println(boards);
		request.setAttribute("boards", boards);
		return "board/boardList.tiles";

	}

}
