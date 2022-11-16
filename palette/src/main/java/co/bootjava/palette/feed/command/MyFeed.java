package co.bootjava.palette.feed.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.art.service.ArtService;
import co.bootjava.palette.art.service.impl.ArtServiceImpl;
import co.bootjava.palette.art.vo.ArtVO;
import co.bootjava.palette.common.Command;

public class MyFeed implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		AccountService dao = new AccountServiceImpl();
		AccountVO account = new AccountVO();
		String id = (String) session.getAttribute("id");
	
		
		account = dao.AccountSelected(id); //feedNum으로 1건 가져오기
		List<ArtVO> list = new ArrayList<ArtVO>();
		ArtService dao1 = new ArtServiceImpl();
		list = dao1.artSelected(id);
		
		
		request.setAttribute("account", account);
		request.setAttribute("artList", list);
		return "feed/myFeed.tiles";
	}

}
