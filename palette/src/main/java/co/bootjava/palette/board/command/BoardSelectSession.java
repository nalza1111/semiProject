package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.common.Command;

public class BoardSelectSession implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//댓글을 등록하게 될 경우 게시물 상세보기 화면에 값이 지워지기 때문에 세션에 잠시저장
		HttpSession session=request.getSession();
		session.setAttribute("number", request.getParameter("number"));
		session.setAttribute("userid", request.getParameter("userid"));
		session.setAttribute("title", request.getParameter("title"));
		session.setAttribute("content", request.getParameter("content"));
		session.setAttribute("writer", request.getParameter("writer"));
		session.setAttribute("cnt", request.getParameter("cnt"));
		session.setAttribute("date",request.getParameter("date") );
		return "boardSelect.do";
	}

}
