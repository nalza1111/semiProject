package co.bootjava.palette.account.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class AccountLogin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//로그인 처리
		AccountService dao = new AccountServiceImpl();
		AccountVO account = new AccountVO();
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String message = "로그인에 실패하였습니다.. 잘 생각해 보세요";
		account = dao.accountLogin(id,password);
		if(account != null) {
			session.setAttribute("id", account.getId());
			session.setAttribute("name", account.getName());
			session.setAttribute("role", account.getRole());
			message = account.getName() + "님 환영합니다";
			request.setAttribute("message", message);
			return "account/accountLogin.tiles";
			
		}
		request.setAttribute("message", message);
		return "account/accountLoginF.tiles";
	}

}
