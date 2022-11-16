package co.bootjava.palette.feed.service;

import java.util.List;

import co.bootjava.palette.feed.vo.FeedVO;

public interface FeedService {
	List<FeedVO> feedSelectList();
	FeedVO feedSelect(FeedVO vo);
	FeedVO feedSelected(int feedNum); //feedNum로 VO조회.
	int feedInsert(FeedVO vo);
	int feedDelete(FeedVO vo);
	int feedUpdate(FeedVO vo);
	boolean userIdCheck(String userId);
	List<FeedVO> mainfeedList(); //메인화면 피드
	int isFeedExist(String id);
	
	
}
