package co.bootjava.palette.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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

}
