package co.bootjava.palette.account.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class PwSend implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AccountService dao = new AccountServiceImpl();
		AccountVO account = new AccountVO();
		String id = request.getParameter("id");
		account = dao.emailFind(id);
		String email = account.getEmail();
		String password = account.getPassword();
		
		String subject = "Palette 비밀번호 찾기";
		String authMail = "비밀번호는 " + password + "입니다.";
		
		String result = dao.sendMail(email, subject, authMail);
		String no= "0";
		if(result =="success") {
			no = "1";
		}
		return "ajax:" + no;
	}

}
