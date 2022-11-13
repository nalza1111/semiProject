package co.bootjava.palette.feed.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.feed.serivce.impl.FeedServiceImpl;
import co.bootjava.palette.feed.service.FeedService;
import co.bootjava.palette.feed.vo.FeedVO;

public class FeedSelect implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 작가 상세목록 1건 가져오기.
		HttpSession session = request.getSession();
		System.out.println("feedSelect 도착함");
		FeedService dao = new FeedServiceImpl();
		FeedVO feed = new FeedVO();
		int num = Integer.parseInt(request.getParameter("feedNum"));
		feed = dao.feedSelected(num); //feedNum으로 1건 가져오기
		
		
		
		
		request.setAttribute("feed", feed);
		
		return "feed/feedSelect.tiles";
	}

}
