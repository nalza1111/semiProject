package co.bootjava.palette.reply.service;

import java.util.List;

import co.bootjava.palette.reply.vo.ReplyVO;

public interface ReplyService {
	List<ReplyVO> replySelectList();	
	ReplyVO replySelect(ReplyVO vo);
	int replyInsert(ReplyVO vo);
	int replyDelete(ReplyVO vo);
	int replyUpdate(ReplyVO vo);
	
	
}
