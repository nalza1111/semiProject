package co.bootjava.palette.feed.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.feed.serivce.impl.FeedServiceImpl;
import co.bootjava.palette.feed.service.FeedService;
import co.bootjava.palette.feed.vo.FeedVO;

public class FeedList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 피드 목록 가져오기.
		FeedService dao = new FeedServiceImpl();
		List<FeedVO> feed = new ArrayList<>();
		feed = dao.feedSelectList(); //피드 전체목록
		request.setAttribute("feed", feed); //결과 담기
		
		return "feed/feedList.tiles";
	}

}
