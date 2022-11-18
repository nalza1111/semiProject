package co.bootjava.palette.exhibit.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;

public class AddExhibitListForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 전시추가폼 호출
		
		return "exhibit/addExhibitListForm.tiles";
	}

}
