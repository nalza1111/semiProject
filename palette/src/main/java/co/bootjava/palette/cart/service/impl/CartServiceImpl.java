package co.bootjava.palette.cart.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.cart.mapper.CartMapper;
import co.bootjava.palette.cart.service.CartService;
import co.bootjava.palette.cart.vo.CartVO;
import co.bootjava.palette.common.DataSource;

public class CartServiceImpl implements CartService{
	private SqlSession SqlSession = DataSource.getInstance().openSession(true);
	private CartMapper map = SqlSession.getMapper(CartMapper.class);

	@Override
	public List<CartVO> cartSelectList() {
		return map.cartSelectList();
	}

	@Override
	public List<CartVO> cartAccountSelectList(CartVO vo) {
		return map.cartAccountSelectList(vo);
	}
	@Override
	public CartVO cartSelect(CartVO vo) {
		return map.cartSelect(vo);
	}

	@Override
	public int cartInsert(CartVO vo) {
		return map.cartInsert(vo);
	}

	@Override
	public int cartDelete(CartVO vo) {
		return map.cartDelete(vo);
	}

	@Override
	public int cartUpdatePlus(CartVO vo) {
		return map.cartUpdatePlus(vo);
	}

	@Override
	public int cartUpdateMinus(CartVO vo) {
		return map.cartUpdateMinus(vo);
	}

	@Override
	public int cartInsertSome(CartVO vo) {
		return map.cartInsertSome(vo);
	}

	@Override
	public int cartUpdatePlusSome(CartVO vo) {
		return map.cartUpdatePlusSome(vo);
	}

	@Override
	public int cartDeleteOrder(CartVO vo) {
		return map.cartDeleteOrder(vo);
	}


}
