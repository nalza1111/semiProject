package co.bootjava.palette.art.mapper;

import java.util.List;

import co.bootjava.palette.art.vo.ArtVO;

public interface ArtMapper {

	int artInsert(ArtVO vo);
	List<ArtVO> artSelected(String id);
	List<ArtVO> mainArtList();
	void viewCntPlus(ArtVO vo);
	int ArtDelete(int artNum); // 내 작품 삭제

}
