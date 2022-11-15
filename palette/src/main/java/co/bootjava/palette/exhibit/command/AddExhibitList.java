package co.bootjava.palette.exhibit.command;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.service.ExhibitService;
import co.bootjava.palette.exhibit.service.impl.ExhibitServiceImpl;
import co.bootjava.palette.exhibit.vo.ExhibitImagesVO;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public class AddExhibitList implements Command {

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
			ExhibitImagesVO io = new ExhibitImagesVO();
			String ofile = mr.getOriginalFileName("image"); // 이용자가 업로드 할 때 파일이름
			
			// 리스트에 글 등록
			vo.setExhibitName(mr.getParameter("exhibitName"));
			vo.setStartDate(mr.getParameter("startDate"));
			vo.setEndDate(mr.getParameter("endDate"));
			vo.setExhibitSchool(mr.getParameter("exhibitSchool"));
			vo.setExhibitMajor(mr.getParameter("exhibitMajor"));
			vo.setImage("image//"+ofile);
			vo.setContent(mr.getParameter("content"));
			
			//시퀀스 값 가져오기
			int r = dao.exhibitNum();
			System.out.println(r + " : exhibitNum");
			Enumeration<?> fileNames = mr.getFileNames();
			while(fileNames.hasMoreElements()) {
				String file = (String) fileNames.nextElement();
				if(mr.getOriginalFileName(file) == null) { // 만약 file객체에 파일이 존재하지 않으면
					continue;
				}
				
				io.setExhibitNum(r);
				io.setOriginImage(mr.getOriginalFileName(file));
				io.setFileImage("image//"+ mr.getFilesystemName(file));
				
				int m = dao.exhibitImageInsert(io); // 이미지 테이블 파일을 업로드
				System.out.println(m+": 건 이미지 테이블에 업로드 성공");
			}
			
			int n = dao.exhibitInsert(vo);
			
			String message = "등록이 실패했습니다";
			if(n>0) {
				message = "글 등록이 정상적으로 이루어졌습니다";
			}
			request.setAttribute("message", message);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "exhibit/addExhibitList.tiles";
	}

}
