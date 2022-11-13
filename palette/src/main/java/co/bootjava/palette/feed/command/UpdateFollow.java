package co.bootjava.palette.feed.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.feed.serivce.impl.FeedServiceImpl;
import co.bootjava.palette.feed.service.FeedService;
import co.bootjava.palette.feed.vo.FeedVO;

public class UpdateFollow implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("updateFollow 도착!!!");
		
		int num = Integer.parseInt(request.getParameter("feedNum"));
		FeedService dao = new FeedServiceImpl();
		FeedVO feed = new FeedVO();
		
		feed = dao.feedSelected(num);
		String job = request.getParameter("job");
		
		// follow 누르면 +1 증가.
		if(job.equals("follow")) {
			int newCnt = feed.getUserFollower();
			newCnt = newCnt + 1;
			feed.setUserFollower(newCnt);
			
			dao.feedUpdate(feed);
			String follow = "follow";
			request.setAttribute("follow", follow);
			
			// unfollow 누르면 -1 감소.
		} else {
			int newCnt = feed.getUserFollower();
			newCnt = newCnt - 1;
			feed.setUserFollower(newCnt);
			
			dao.feedUpdate(feed);
			String follow = "unfollow";
			request.setAttribute("follow", follow);
		}
		return "feed/feedSelect.tiles";
	}

}
