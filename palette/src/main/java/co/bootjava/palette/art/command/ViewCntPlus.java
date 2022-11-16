package co.bootjava.palette.art.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.art.service.ArtService;
import co.bootjava.palette.art.service.impl.ArtServiceImpl;
import co.bootjava.palette.art.vo.ArtVO;
import co.bootjava.palette.common.Command;

public class ViewCntPlus implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ArtVO vo = new ArtVO();
		ArtService dao = new ArtServiceImpl();
		
		vo.setArtNum(Integer.parseInt(request.getParameter("artNum")));
		dao.viewCntPlus(vo);
		return "ajax:1";
	}

}
