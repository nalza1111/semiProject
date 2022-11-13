package co.bootjava.palette.exhibit.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.service.ExhibitService;
import co.bootjava.palette.exhibit.service.impl.ExhibitServiceImpl;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public class IngList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 현재 리스트만 보여주기
		ExhibitService dao = new ExhibitServiceImpl();
		List<ExhibitVO> exhibits = new ArrayList<>();
		exhibits = dao.exhibitSelect();
		System.out.println(exhibits);
		request.setAttribute("exhibits", exhibits);
		
		// 날짜함수로 날짜 뽑아서
		
		
		return "exhibit/exhibitList.tiles";
	}

}
