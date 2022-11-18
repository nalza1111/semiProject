package co.bootjava.palette.reply.mapper;

import java.util.List;

import co.bootjava.palette.reply.vo.ReplyVO;

public interface ReplyMapper {
	List<ReplyVO> replySelectList(ReplyVO vo);	
	ReplyVO replySelect(ReplyVO vo);
	int replyInsert(ReplyVO vo);
	int replyDelete(ReplyVO vo);
	int replyUpdate(ReplyVO vo);
}
