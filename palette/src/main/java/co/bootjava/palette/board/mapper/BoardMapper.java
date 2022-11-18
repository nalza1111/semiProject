package co.bootjava.palette.board.mapper;

import java.util.List;

import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.board.vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> boardSelectList(); //게시물 전체 리스트가져오기
	List<BoardVO> boardDetailList(BoardVO vo);//게시물 조회
	BoardVO boardSelect(BoardVO vo); //게시물 한건 가져오기
	int boardInsert(BoardVO vo); //게시물 등록하기
	int boardDelete(BoardVO vo); //게시물 삭제하기
	int boardUpdate(BoardVO vo); //게시물 수정하기	
	int viewCnt(BoardVO vo);//조회수변경
	List<BoardVO> myBoardList(BoardVO vo);//나의 게시물보기
	int boardBan(AccountVO vo);//신고횟수증가
	List<BoardVO> boardTodayList();
	
	List<BoardVO> mainBoardList();//메인에 보드 출력
	
	public int totalCnt();
	public List<BoardVO> pageList(int pg);
}
