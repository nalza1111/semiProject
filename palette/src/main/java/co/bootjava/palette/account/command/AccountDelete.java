package co.bootjava.palette.account.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class AccountDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AccountService dao = new AccountServiceImpl();
		String id = request.getParameter("id");
		System.out.println(id);
		int n = dao.accountDelete(id);
		if(n>0) {
			System.out.println("삭제완료!");
		}
		return "manageSite.do";
	}

}
