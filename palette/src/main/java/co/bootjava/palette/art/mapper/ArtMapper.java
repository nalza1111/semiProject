package co.bootjava.palette.art.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.bootjava.palette.art.vo.ArtVO;

public interface ArtMapper {

	int artInsert(ArtVO vo);
	List<ArtVO> artSelected(String id);
	List<ArtVO> mainArtList();
	void viewCntPlus(ArtVO vo);

}
