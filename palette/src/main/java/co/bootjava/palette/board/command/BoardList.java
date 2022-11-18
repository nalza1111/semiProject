package co.bootjava.palette.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.board.vo.PageVO;
import co.bootjava.palette.common.Command;

public class BoardList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시물목록 가져오기
		BoardService dao=new BoardServiceImpl();
		List<BoardVO> boards=new ArrayList<BoardVO>();
		boards=dao.boardSelectList();
		List<BoardVO> todayBoards=new ArrayList<BoardVO>();
		todayBoards=dao.boardTodayList();
		request.setAttribute("todayBoards", todayBoards);
//		request.setAttribute("boards", boards);
		
		String page=request.getParameter("page");		
		page=page==null?"1":page;
		int pg=Integer.parseInt(page);			
		int totalcount=dao.totalCnt();
		PageVO paging=new PageVO(totalcount, pg);
		List<BoardVO> pageList=dao.pageList(pg);
		request.setAttribute("boards", pageList);
		request.setAttribute("page", paging);
		return "board/boardList.tiles";
	}
}
