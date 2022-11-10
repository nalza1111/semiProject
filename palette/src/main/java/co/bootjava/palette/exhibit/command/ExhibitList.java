package co.bootjava.palette.exhibit.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.service.ExhibitService;
import co.bootjava.palette.exhibit.service.impl.ExhibitServiceImpl;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public class ExhibitList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 전시목록 가져오기
		ExhibitService dao = new ExhibitServiceImpl();
		List<ExhibitVO> exhibits = new ArrayList<>();
		exhibits = dao.exhibitSelectList();
		System.out.println(exhibits);
		request.setAttribute("exhibits", exhibits);		
		
		return "exhibit/exhibitList.tiles";
	}

}
