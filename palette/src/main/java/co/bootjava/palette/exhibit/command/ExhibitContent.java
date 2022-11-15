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

public class ExhibitContent implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		 //상세조회창 호출
		String bno = request.getParameter("exhibitNum");
		
		ExhibitService dao = new ExhibitServiceImpl();
		ExhibitVO vo = new ExhibitVO();
		List<ExhibitImagesVO> listio = new ArrayList<ExhibitImagesVO>();
		vo = dao.exhibitNumSelect(Integer.parseInt(bno));
		listio = dao.exhibitNumImageSelect(Integer.parseInt(bno));
		request.setAttribute("exhibit", vo);
		request.setAttribute("exhibitImages", listio);
		
		return "exhibit/exhibitContent.tiles";
	}

}
