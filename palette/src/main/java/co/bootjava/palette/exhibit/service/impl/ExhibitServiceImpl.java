package co.bootjava.palette.exhibit.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.common.DataSource;
import co.bootjava.palette.exhibit.mapper.ExhibitMapper;
import co.bootjava.palette.exhibit.service.ExhibitService;
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
	public ExhibitVO exhibitSelect(ExhibitVO vo) {
		// 현재 전시 리스트
		return map.exhibitSelect(vo);
	}
	@Override
	public ExhibitVO exhibitNumSelect(ExhibitVO vo) {
		// 해당 전시 목록만 출력
		return map.exhibitNumSelect(vo);
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
	

}
