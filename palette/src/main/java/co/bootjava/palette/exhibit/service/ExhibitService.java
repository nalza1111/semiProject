package co.bootjava.palette.exhibit.service;

import java.util.List;

import co.bootjava.palette.exhibit.vo.ExhibitVO;

public interface ExhibitService {
	List<ExhibitVO> exhibitSelectList();   // 전시 전체 목록
	List<ExhibitVO> exhibitSelect(); // 현재 진행중인 전시 목록
	ExhibitVO exhibitNumSelect(int exhibitNum); // 해당 전시번호의 목록만
	int exhibitInsert(ExhibitVO vo); 	   // 전시입력(관리자)
	int exhibitUpdate(ExhibitVO vo);       // 전시수정(관리자)
	int exhibitDelete(ExhibitVO vo);       // 전시삭제(관리자)
	
	List<ExhibitVO> exhibitImageList(ExhibitVO vo); // 해당 전시에 해당하는 이미지 리스트 출력
}
