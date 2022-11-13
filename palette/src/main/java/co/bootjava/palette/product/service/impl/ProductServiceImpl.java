package co.bootjava.palette.product.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.common.DataSource;
import co.bootjava.palette.product.mapper.ProductMapper;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.vo.ProductVO;

public class ProductServiceImpl implements ProductService {
	private SqlSession SqlSession = DataSource.getInstance().openSession(true);
	private ProductMapper map = SqlSession.getMapper(ProductMapper.class);
	
	@Override
	public List<ProductVO> productSelectList() {
		return map.productSelectList();
	}

	@Override
	public ProductVO productSelect(ProductVO vo) {
		return map.productSelect(vo);
	}

	@Override
	public int productInsert(ProductVO vo) {
		return map.productInsert(vo);
	}

	@Override
	public int productDelete(ProductVO vo) {
		return map.productDelete(vo);
	}

	@Override
	public int productUpdate(ProductVO vo) {
		return map.productUpdate(vo);
	}

	@Override
	public int productUpdateHit(ProductVO vo) {
		return map.productUpdateHit(vo);
	}

	@Override
	public List<ProductVO> productSelectSortList(int n) {
		return map.productSelectSortList(n);
	}

	@Override
	public List<ProductVO> productSelectSearchList(ProductVO vo) {
		return map.productSelectSearchList(vo);
	}


}
