package co.bootjava.palette.board.service;

import java.util.List;

import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.board.vo.BoardVO;

public interface BoardService {
	List<BoardVO> boardSelectList();
	List<BoardVO> myBoardList(BoardVO vo);
	BoardVO boardSelect(BoardVO vo);
	int boardInsert(BoardVO vo);
	int boardDelete(BoardVO vo);
	int boardUpdate(BoardVO vo);	
	List<BoardVO> boardDetailList(BoardVO vo);
	int viewCnt(BoardVO vo);
	int boardBan(AccountVO vo);	
	List<BoardVO> boardTodayList();
	
	List<BoardVO> mainBoardList();
	
	   public int totalCnt(); // 전체 row 수 카운트

	   public List<BoardVO> pageList(int pg);
}
