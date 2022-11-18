package co.bootjava.palette.art.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.bootjava.palette.art.service.ArtService;
import co.bootjava.palette.art.service.impl.ArtServiceImpl;
import co.bootjava.palette.art.vo.ArtVO;
import co.bootjava.palette.common.Command;

public class ArtInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String saveDir = request.getSession().getServletContext().getRealPath("image"); // 저장위치
		String encod = "UTF-8";
		int maxSize = 500 * 1024 * 1024; //500메가로 제한
		ArtVO vo = new ArtVO();
		ArtService dao = new ArtServiceImpl();

		try {
			MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, encod, new DefaultFileRenamePolicy());
			String ofile = mr.getOriginalFileName("artImage");
			String id = (String) session.getAttribute("id");
			vo.setArtId(id);
			vo.setArtTitle(mr.getParameter("artTitle"));
			vo.setArtContent(mr.getParameter("artContent"));
			vo.setArtImage("image//"+ofile);
			
			dao.artInsert(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "myFeed.do";
	}

}
