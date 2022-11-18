package co.bootjava.palette.reply.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.reply.service.ReplyService;
import co.bootjava.palette.reply.service.impl.ReplyServiceImpl;
import co.bootjava.palette.reply.vo.ReplyVO;

public class ReplyJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 댓글 저장하는 기능	
		HttpSession session=request.getSession();		
		ReplyService dao=new ReplyServiceImpl();
		ReplyVO vo=new ReplyVO();
		vo.setReplyContent(request.getParameter("content"));
		vo.setReplyGiveId((String)session.getAttribute("id"));
		vo.setReplyNumber(Integer.parseInt(session.getAttribute("number").toString()));
		
		session.setAttribute("replycontent", request.getParameter("content"));		
		
		dao.replyInsert(vo);		

		return "boardSelect.do";
	}
}
