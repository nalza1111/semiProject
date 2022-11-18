package co.bootjava.palette.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.board.mapper.BoardMapper;
import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.DataSource;

public class BoardServiceImpl implements BoardService{

	private SqlSession SqlSession=DataSource.getInstance().openSession(true);
	private BoardMapper map=SqlSession.getMapper(BoardMapper.class);
	
	@Override
	public List<BoardVO> boardSelectList() {
		// 게시물 전체리스트
		return map.boardSelectList();
	}
	
	@Override
	public List<BoardVO> boardTodayList() {
		// 오늘 조회수에 따라 리스트
		return map.boardTodayList();
	}
	
	@Override
	public List<BoardVO> boardDetailList(BoardVO vo) {
		// 글조회
		return map.boardDetailList(vo);
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		// 한건의 게시물 정보 가져오기
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		// 게시물 등록하는 곳
		return map.boardInsert(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		// 게시물 삭제하는 곳
		return map.boardDelete(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		// 게시물 수정하는 곳.
		return map.boardUpdate(vo);
	}

	@Override
	public int viewCnt(BoardVO vo) {
		// 조회수 변경
		return map.viewCnt(vo);
	}

	@Override
	public List<BoardVO> myBoardList(BoardVO vo) {
		// 나의 게시물보기
		return map.myBoardList(vo);
	}

	@Override
	public int boardBan(AccountVO vo) {
		// 신고횟수증가
		return map.boardBan(vo);
	}
	
	@Override
	public List<BoardVO> mainBoardList() {
		//메인에 보드 출력
		return map.mainBoardList();
	}

	@Override
	public int totalCnt() {
		// TODO Auto-generated method stub
		return map.totalCnt();
	}

	@Override
	public List<BoardVO> pageList(int pg) {
		// TODO Auto-generated method stub
		return map.pageList(pg);
	}
	
}
