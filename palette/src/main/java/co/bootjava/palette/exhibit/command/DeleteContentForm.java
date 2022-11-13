package co.bootjava.palette.exhibit.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.service.ExhibitService;
import co.bootjava.palette.exhibit.service.impl.ExhibitServiceImpl;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public class DeleteContentForm implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 전시글 삭제
		String bno = request.getParameter("exhibitNum");
		
		ExhibitService dao = new ExhibitServiceImpl();
		ExhibitVO vo = dao.exhibitNumSelect(Integer.parseInt(bno));
		
		request.setAttribute("exhibit", vo);
		return "exhibit/deleteContentForm.tiles";
	}

}
