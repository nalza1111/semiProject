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
import co.bootjava.palette.reply.service.ReplyService;
import co.bootjava.palette.reply.service.impl.ReplyServiceImpl;
import co.bootjava.palette.reply.vo.ReplyVO;

public class BoardSelect implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시판 상세보기 하는 곳.
		BoardService dao=new BoardServiceImpl();
		BoardVO vo=new BoardVO();
		HttpSession session=request.getSession();
		
		vo.setUserId((String)session.getAttribute("userid"));		
		vo.setBoardNumber(Integer.parseInt(session.getAttribute("number").toString()));	
		vo.setBoardTitle((String)session.getAttribute("title"));
		vo.setBoardContent((String)session.getAttribute("content"));
		vo.setBoardWriter((String)session.getAttribute("writer"));
		vo.setViewCnt(Integer.parseInt(session.getAttribute("cnt").toString()));
		vo.setCreateDate((String)session.getAttribute("date"));
		dao.boardSelect(vo);
		dao.viewCnt(vo);		
		request.setAttribute("board",vo);
		
		
		List<ReplyVO> replys=new ArrayList<ReplyVO>();
		ReplyVO vo2=new ReplyVO();
		ReplyService dao2=new ReplyServiceImpl();
		vo2.setReplyNumber(Integer.parseInt(session.getAttribute("number").toString()));
		replys=dao2.replySelectList(vo2);
		
		request.setAttribute("replys", replys);
		
		return "board/boardSelectForm.tiles";
		
		
	}

}
