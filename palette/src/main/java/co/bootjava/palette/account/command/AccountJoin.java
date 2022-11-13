package co.bootjava.palette.account.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class AccountJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AccountService dao = new AccountServiceImpl();
		AccountVO vo = new AccountVO();
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		String address = request.getParameter("postcode") + ", " + request.getParameter("address") + ", "
				+ request.getParameter("detailAddress");
		vo.setAddress(address);
		vo.setSchool(request.getParameter("school"));
		vo.setMajor(request.getParameter("major"));
		dao.AccountInsert(vo);
		return "account/accountLoginForm.tiles";
	}

}
