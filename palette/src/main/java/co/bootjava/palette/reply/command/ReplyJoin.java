package co.bootjava.palette.reply.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;
import co.bootjava.palette.reply.service.ReplyService;
import co.bootjava.palette.reply.service.impl.ReplyServiceImpl;
import co.bootjava.palette.reply.vo.ReplyVO;

public class ReplyJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 댓글 저장하는 기능	
		HttpSession session=request.getSession();		
		String id=(String) session.getAttribute("id");
		ReplyService dao=new ReplyServiceImpl();
		ReplyVO vo=new ReplyVO();
		vo.setReplyContent(request.getParameter("content"));
		vo.setReplyGiveId(id);
		int n=dao.replyInsert(vo);
		
		//댓글 전체리스트
		BoardService dao2=new BoardServiceImpl();
		BoardVO boardVO=new BoardVO();
		boardVO.setBoardNumber(Integer.parseInt(request.getParameter("number")));
		boardVO=dao2.boardSelect(boardVO);
		request.setAttribute("board", boardVO);

		return "board/boardSelectForm.tiles";
	}

}
