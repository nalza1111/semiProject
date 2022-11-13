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
				System.out.println(saveDir);
				String encod = "UTF-8";
				int maxSize = 5 * 1024 * 1024; // 5메가로 제한
				
				try {
					MultipartRequest mr = new MultipartRequest(
						request,
						saveDir,
						maxSize,
						encod,
						new DefaultFileRenamePolicy()
					);
					
					// 글 수정
					ExhibitService dao = new ExhibitServiceImpl();
					ExhibitVO vo = new ExhibitVO();
					vo.setExhibitName(mr.getParameter("exhibitName"));
					vo.setStartDate(mr.getParameter("startDate"));
					vo.setEndDate(mr.getParameter("endDate"));
					vo.setExhibitSchool(mr.getParameter("exhibitSchool"));
					vo.setExhibitMajor(mr.getParameter("exhibitMajor"));
					// 이미지가 널이면 수정을 하지 않는다 -> 처음 이미지 수정 못함
					vo.setImage(mr.getFilesystemName("image"));
					vo.setContent(mr.getParameter("content"));
					vo.setExhibitNum(Integer.parseInt(mr.getParameter("exhibitNum")));
					System.out.println(vo);
					
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
