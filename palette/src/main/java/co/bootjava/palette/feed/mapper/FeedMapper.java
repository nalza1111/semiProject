package co.bootjava.palette.feed.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.bootjava.palette.feed.vo.FeedVO;

public interface FeedMapper {
	List<FeedVO> feedSelectList();
	FeedVO feedSelect(FeedVO vo);
	int feedInsert(FeedVO vo);
	int feedDelete(FeedVO vo);
	int feedUpdate(FeedVO vo);
	FeedVO feedSelected(int feedNum);
	boolean userIdCheck(String userId);
	List<FeedVO> mainFeedList();
	int isFeedExist(@Param("id") String id);
	
	
}
