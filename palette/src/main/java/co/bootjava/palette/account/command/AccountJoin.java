package co.bootjava.palette.account.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class AccountJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String saveDir = request.getSession().getServletContext().getRealPath("image"); // 저장위치
		System.out.println(saveDir + "에 이미지 저장됨");
		String encod = "UTF-8";
		int maxSize = 100 * 1024 * 1024; // 100메가로 제한
		AccountService dao = new AccountServiceImpl();
		AccountVO vo = new AccountVO();

		try {
			MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, encod, new DefaultFileRenamePolicy());
			String ofile = mr.getOriginalFileName("image");

			vo.setId(mr.getParameter("id"));
			vo.setPassword(mr.getParameter("password"));
			vo.setName(mr.getParameter("name"));
			vo.setEmail(mr.getParameter("email"));
			String address = mr.getParameter("postcode") + ", " + mr.getParameter("address") + ", "
					+ mr.getParameter("detailAddress");
			vo.setAddress(address);
			vo.setSchool(mr.getParameter("school"));
			vo.setMajor(mr.getParameter("major"));
			vo.setImage("image//" + ofile);
			
			dao.AccountInsert(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "account/accountLoginForm.tiles";
	}

}
