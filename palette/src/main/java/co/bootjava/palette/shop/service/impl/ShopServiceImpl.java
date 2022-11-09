package co.bootjava.palette.shop.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.common.DataSource;
import co.bootjava.palette.product.ProductVO;
import co.bootjava.palette.shop.mapper.ShopMapper;
import co.bootjava.palette.shop.service.ShopService;

public class ShopServiceImpl implements ShopService {
	private SqlSession SqlSession = DataSource.getInstance().openSession(true);
	private ShopMapper map = SqlSession.getMapper(ShopMapper.class);
	
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

}
