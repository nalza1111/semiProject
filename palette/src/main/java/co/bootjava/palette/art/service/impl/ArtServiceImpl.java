package co.bootjava.palette.art.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.art.mapper.ArtMapper;
import co.bootjava.palette.art.service.ArtService;
import co.bootjava.palette.art.vo.ArtVO;
import co.bootjava.palette.common.DataSource;

public class ArtServiceImpl implements ArtService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); // 오토 커밋
	private ArtMapper map = sqlSession.getMapper(ArtMapper.class); // 데이터베이스 연결후 커넥션 호출
	
	@Override
	public int artInsert(ArtVO vo) { //작품 업로드 
		return map.artInsert(vo);
	}

	@Override
	public List<ArtVO> artSelected(String id) { //작품 상세보기
		return map.artSelected(id);
	}

	@Override
	public List<ArtVO> mainArtList() { //메인 작품 출력
		return map.mainArtList();
	}

	@Override
	public void viewCntPlus(ArtVO vo) {
		map.viewCntPlus(vo);
		
	}

	@Override
	public int ArtDelete(int artNum) {
		return map.ArtDelete(artNum);
	}


}
