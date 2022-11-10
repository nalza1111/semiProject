package co.bootjava.palette.account.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.common.Command;

public class AjaxIdCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// ajax 아이디 중복체크
		AccountService dao = new AccountServiceImpl();
		String id = request.getParameter("id");
		boolean b = dao.isAccountIdCheck(id);
		String result = "0";
		if(b) {
			result ="1";
		}
		return "ajax:" + result;
	}

}
