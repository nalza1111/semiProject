package co.bootjava.palette.feed.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class FeedList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 피드 목록 가져오기.
		AccountService dao = new AccountServiceImpl();
		List<AccountVO> account = new ArrayList<>();
		account = dao.accountList(); //피드 전체목록
		request.setAttribute("account", account); //결과 담기
		
		return "feed/feedList.tiles";
	}

}
