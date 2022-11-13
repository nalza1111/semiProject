package co.bootjava.palette.exhibit.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.service.ExhibitService;
import co.bootjava.palette.exhibit.service.impl.ExhibitServiceImpl;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public class DeleteContent implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 삭제
		ExhibitService dao = new ExhibitServiceImpl();
		ExhibitVO vo = new ExhibitVO();
		vo.setExhibitNum(Integer.parseInt(request.getParameter("exhibitNum")));
		int n = dao.exhibitDelete(vo);
		
		String message = "글 삭제 실패했습니다";
		if(n>0) {
			message = "글 삭제가 정상적으로 이루어졌습니다";
		}
		request.setAttribute("message", message);
		return "exhibit/deleteContent.tiles";
	}

}
