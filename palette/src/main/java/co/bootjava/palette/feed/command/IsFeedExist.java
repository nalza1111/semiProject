package co.bootjava.palette.feed.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.feed.serivce.impl.FeedServiceImpl;
import co.bootjava.palette.feed.service.FeedService;

public class IsFeedExist implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		FeedService dao = new FeedServiceImpl();
		String id = request.getParameter("id");
		int n = dao.isFeedExist(id);
		if(n > 0) {
			return "1";
		}
		return "0";
	}

}
