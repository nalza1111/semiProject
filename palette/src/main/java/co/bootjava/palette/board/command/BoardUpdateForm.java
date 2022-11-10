package co.bootjava.palette.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;

public class BoardUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시물 수정 폼으로 연결		
		return "board/boardUpdateForm.tiles";
	}

}
