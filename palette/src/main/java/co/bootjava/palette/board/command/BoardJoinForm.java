package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;

public class BoardJoinForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//게시물 등록으로 가는화면
		return "board/boardJoinForm.tiles";		
	}
}
