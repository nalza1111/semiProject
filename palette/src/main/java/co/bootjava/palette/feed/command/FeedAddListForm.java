package co.bootjava.palette.feed.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.feed.serivce.impl.FeedServiceImpl;
import co.bootjava.palette.feed.service.FeedService;
import co.bootjava.palette.feed.vo.FeedVO;

public class FeedAddListForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "feed/feedAddListForm.tiles";
	}

}
