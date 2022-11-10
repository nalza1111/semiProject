package co.bootjava.palette.board.mapper;

import java.util.List;

import co.bootjava.palette.board.vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> boardSelectList(); //게시물 전체 리스트가져오기
	BoardVO boardSelect(BoardVO vo); //게시물 한건 가져오기
	int boardInsert(BoardVO vo); //게시물 등록하기
	int boardDelete(BoardVO vo); //게시물 삭제하기
	int boardUpdate(BoardVO vo); //게시물 수정하기
}
