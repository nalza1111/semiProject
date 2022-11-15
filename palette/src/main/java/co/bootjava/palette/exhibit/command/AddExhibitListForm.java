package co.bootjava.palette.exhibit.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.service.ExhibitService;
import co.bootjava.palette.exhibit.service.impl.ExhibitServiceImpl;
import co.bootjava.palette.exhibit.vo.ExhibitImagesVO;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public class AddExhibitListForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 전시추가폼 호출
		
		return "exhibit/addExhibitListForm.tiles";
	}

}
