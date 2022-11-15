package co.bootjava.palette.exhibit.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.common.DataSource;
import co.bootjava.palette.exhibit.mapper.ExhibitMapper;
import co.bootjava.palette.exhibit.service.ExhibitService;
import co.bootjava.palette.exhibit.vo.ExhibitImagesVO;
import co.bootjava.palette.exhibit.vo.ExhibitVO;

public class ExhibitServiceImpl implements ExhibitService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ExhibitMapper map = sqlSession.getMapper(ExhibitMapper.class);
	@Override
	public List<ExhibitVO> exhibitSelectList() {
		// exhibit 전체리스트
		return map.exhibitSelectList();
	}
	@Override
	public List<ExhibitVO> exhibitSelect() {
		// 현재 전시 리스트
		return map.exhibitSelect();
	}
	@Override
	public ExhibitVO exhibitNumSelect(int exhibitNum) {
		// 해당 전시 목록만 출력
		return map.exhibitNumSelect(exhibitNum);
	}
	
	//관리자
	@Override
	public int exhibitInsert(ExhibitVO vo) {
		// 전시 등록 (관리자)
		return map.exhibitInsert(vo);
	}
	@Override
	public int exhibitUpdate(ExhibitVO vo) {
		// 전시 수정 (관리자)
		return map.exhibitUpdate(vo);
	}
	@Override
	public int exhibitDelete(ExhibitVO vo) {
		// 전시 삭제 (관리자)
		return map.exhibitDelete(vo);
	}
	
	@Override
	public int exhibitNum() {
		// 시퀀스 찾기
		return map.exhibitNum();
	}
	@Override
	public int exhibitImageInsert(ExhibitImagesVO io) {
		// 상세이미지 저장
		return map.exhibitImageInsert(io);

	}
	@Override
	public List<ExhibitImagesVO> exhibitNumImageSelect(int exhibitNum) {
		// 해당 전시의 상세 이미지 출력
		return map.exhibitNumImageSelect(exhibitNum);
	}
	@Override
	public int exhibitImageUpdate(ExhibitImagesVO io) {
		// 이미지 수정
		return map.exhibitImageUpdate(io);
	}
	

}
