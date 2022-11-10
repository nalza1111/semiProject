package co.bootjava.palette.exhibit.mapper;

import java.util.List;

import co.bootjava.palette.exhibit.vo.ExhibitVO;

public interface ExhibitMapper {
	List<ExhibitVO> exhibitSelectList();   		// 전시 전체 목록
	ExhibitVO exhibitSelect(ExhibitVO vo); 		// 현재 진행중인 전시 목록
	ExhibitVO exhibitNumSelect(ExhibitVO vo);   // 해당 전시번호의 목록만
	int exhibitInsert(ExhibitVO vo); 	   		// 전시입력(관리자)
	int exhibitUpdate(ExhibitVO vo);       		// 전시수정(관리자)
	int exhibitDelete(ExhibitVO vo);      		// 전시삭제(관리자)
	
}
