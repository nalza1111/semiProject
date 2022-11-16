package co.bootjava.palette.feed.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class FeedSelect implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 작가 상세목록 1건 가져오기.
		HttpSession session = request.getSession();
		AccountService dao = new AccountServiceImpl();
		AccountVO account = new AccountVO();
		String id = request.getParameter("id");
		account = dao.AccountSelected(id); //feedNum으로 1건 가져오기
		
		
		
		
		request.setAttribute("account", account);
		
		return "feed/feedSelect.tiles";
	}

}
