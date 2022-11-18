package co.bootjava.palette.account.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class ManageSite implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AccountService dao = new AccountServiceImpl();
		List<AccountVO> accVO = new ArrayList<>();
		accVO = dao.accountListM();
		request.setAttribute("account", accVO);
		
		
		
		return "account/manageSite.tiles";
	}

}
