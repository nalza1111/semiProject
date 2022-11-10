package co.bootjava.palette.exhibit.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;

public class ExhibitContent implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 상세조회창 호출
//		String bno = request.getParameter("exhibitNum");
//		
//		ExhibitService dao = new ExhibitServiceImpl();
//		ExhibitVO vo = dao.exhibitNumSelect(Integer.parseInt(bno));
//		
//		request.setAttribute
		
		return "exhibit/exhibitContent.tiles";
	}

}
