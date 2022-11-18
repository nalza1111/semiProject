package co.bootjava.palette.art.service;

import java.util.List;

import co.bootjava.palette.art.vo.ArtVO;

public interface ArtService {

	int artInsert(ArtVO vo); //내 작품 추가

	List<ArtVO> artSelected(String id);

	List<ArtVO> mainArtList();

	void viewCntPlus(ArtVO vo);

	int ArtDelete(int artNum); // 내 작품 삭제


}
