package co.bootjava.palette.reply.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.common.DataSource;
import co.bootjava.palette.reply.mapper.ReplyMapper;
import co.bootjava.palette.reply.service.ReplyService;
import co.bootjava.palette.reply.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{

	private SqlSession SqlSession=DataSource.getInstance().openSession(true);
	private ReplyMapper map=SqlSession.getMapper(ReplyMapper.class);
	
	@Override
	public int replyInsert(ReplyVO vo) {
		// 댓글 추가
		return map.replyInsert(vo);
	}

	@Override
	public int replyDelete(ReplyVO vo) {
		// 댓글 삭제
		return map.replyDelete(vo);
	}

	@Override
	public List<ReplyVO> replySelectList(ReplyVO vo) {
		// 댓글 목록
		return map.replySelectList(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		// 댓글 수정
		return map.replyUpdate(vo);
	}

	@Override
	public ReplyVO replySelect(ReplyVO vo) {
		// 댓글 선택
		return map.replySelect(vo);
	}

}
