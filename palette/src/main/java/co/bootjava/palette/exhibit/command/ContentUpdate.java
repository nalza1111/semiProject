package co.bootjava.palette.exhibit.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.service.ExhibitService;
import co.bootjava.palette.exhibit.service.impl.ExhibitServiceImpl;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public class ContentUpdate implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 사진
		String saveDir = request.getSession().getServletContext().getRealPath("image"); //저장위치
		System.out.println(saveDir+"에 이미지 저장됨");
		String encod = "UTF-8";
		int maxSize = 100 * 1024 * 1024; // 100메가로 제한
		ExhibitService dao = new ExhibitServiceImpl();
		
		
		try {
			MultipartRequest mr = new MultipartRequest(
				request,
				saveDir,
				maxSize,
				encod,
				new DefaultFileRenamePolicy()
			);
			ExhibitVO vo = new ExhibitVO();
			String ofile = mr.getOriginalFileName("image"); // 이용자가 업로드 할 때 파일이름
			
			// 리스트에 글 등록
			vo.setExhibitName(mr.getParameter("exhibitName"));
			vo.setStartDate(mr.getParameter("startDate"));
			vo.setEndDate(mr.getParameter("endDate"));
			vo.setExhibitSchool(mr.getParameter("exhibitSchool"));
			vo.setExhibitMajor(mr.getParameter("exhibitMajor"));
			vo.setImage("image//"+ofile);
			vo.setContent(mr.getParameter("content"));
			vo.setExhibitNum(Integer.parseInt(mr.getParameter("exhibitNum")));
			int n = dao.exhibitUpdate(vo);
			
			String message = "수정이 실패했습니다";
			if(n>0) {
				message = "글 수정이 정상적으로 이루어졌습니다";
			}
			request.setAttribute("message", message);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		return "exhibit/contentUpdate.tiles";
	}

}
