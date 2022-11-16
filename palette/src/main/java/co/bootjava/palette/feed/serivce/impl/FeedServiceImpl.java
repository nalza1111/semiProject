package co.bootjava.palette.feed.serivce.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.common.DataSource;
import co.bootjava.palette.feed.mapper.FeedMapper;
import co.bootjava.palette.feed.service.FeedService;
import co.bootjava.palette.feed.vo.FeedVO;


public class FeedServiceImpl implements FeedService {
	// DB연결, 호출
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private FeedMapper map = sqlSession.getMapper(FeedMapper.class);
	

	@Override
	public List<FeedVO> feedSelectList() {
		return map.feedSelectList();
	}

	@Override
	public FeedVO feedSelect(FeedVO vo) {
		return map.feedSelect(vo);
	}

	@Override
	public int feedInsert(FeedVO vo) {
		return map.feedInsert(vo);
	}

	@Override
	public int feedDelete(FeedVO vo) {
		return map.feedDelete(vo);
	}

	@Override
	public int feedUpdate(FeedVO vo) {
		return map.feedUpdate(vo);
	}

	

	@Override
	public FeedVO feedSelected(int feedNum) {
		return  map.feedSelected(feedNum);
	}
	
	@Override
	public boolean userIdCheck(String userId) {
		return map.userIdCheck(userId);
	}
	
	@Override
	public List<FeedVO> mainfeedList() {
		return map.mainFeedList();
	}

	@Override
	public int isFeedExist(String id) {
		return map.isFeedExist(id);
	}


}
