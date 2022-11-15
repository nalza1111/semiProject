package co.bootjava.palette.exhibit.mapper;

import java.util.List;

import co.bootjava.palette.exhibit.vo.ExhibitImagesVO;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public interface ExhibitMapper {
	List<ExhibitVO> exhibitSelectList();   		// 전시 전체 목록
	List<ExhibitVO> exhibitSelect(); 		// 현재 진행중인 전시 목록
	ExhibitVO exhibitNumSelect(int exhibitNum);   // 해당 전시번호의 목록만
	int exhibitInsert(ExhibitVO vo); 	   		// 전시입력(관리자)
	int exhibitUpdate(ExhibitVO vo);       		// 전시수정(관리자)
	int exhibitDelete(ExhibitVO vo);      		// 전시삭제(관리자)

	
	int exhibitImageInsert(ExhibitImagesVO io); // 상세 이미지 추가
	int exhibitNum(); // 시퀀스값 찾기
	List<ExhibitImagesVO> exhibitNumImageSelect(int exhibitNum); // 해당 전시번호의 목록만(이미지테이블)
	int exhibitImageUpdate(ExhibitImagesVO io); // 이미지 수정
}
