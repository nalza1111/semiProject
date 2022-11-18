package co.bootjava.palette.feed.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.Command;

public class UpdateFollow implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("updateFollow 도착!!!");
		
		AccountService dao = new AccountServiceImpl();
		AccountVO account = new AccountVO();
		
		String id = request.getParameter("id");
		String job = request.getParameter("job");
		
		account = dao.AccountSelected(id);
		

		// follow 누르면 +1 증가.
		if(job.equals("follow")) {
			int newCnt = account.getFollower();
			newCnt = newCnt + 1;
			account.setFollower(newCnt);
			
			dao.updateAccountFollower(account);
			String follow = "follow";
			request.setAttribute("follow", follow);
			
		// unfollow 누르면 -1 감소.
		} else {
			int newCnt = account.getFollower();
			newCnt = newCnt - 1;
			account.setFollower(newCnt);
			
			dao.updateAccountFollower(account);
			String follow = "unfollow";
			request.setAttribute("follow", follow);
		}
		return "feed/feedSelect.tiles";
	}

}
