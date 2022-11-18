package co.bootjava.palette.reply.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.reply.service.ReplyService;
import co.bootjava.palette.reply.service.impl.ReplyServiceImpl;
import co.bootjava.palette.reply.vo.ReplyVO;

public class ReplyDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 댓글 삭제		
		ReplyService dao=new ReplyServiceImpl();
		ReplyVO vo=new ReplyVO();
		vo.setReplyContent(request.getParameter("content"));
		vo.setReplyGiveId(request.getParameter("id"));
		vo.setReplyNumber(Integer.parseInt( request.getParameter("number")));		
		System.out.println(vo);
		int n=dao.replyDelete(vo);
		String message="실패하였습니다.";
		if(n>0) {
			message="정상적 처리가 이루어 졌습니다.";
		}
		request.setAttribute("message", message);
				
		return "board/boardLogin.tiles";	}

}
