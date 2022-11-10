package co.bootjava.palette.cart.service;

import java.util.List;

import co.bootjava.palette.cart.CartVO;

public interface CartService {
	List<CartVO> cartSelectList();
	List<CartVO> cartAccountSelectList(CartVO vo);
	CartVO cartSelect(CartVO vo);
	int cartInsert(CartVO vo);
	int cartDelete(CartVO vo);
	int cartUpdatePlus(CartVO vo);
	int cartUpdateMinus(CartVO vo);
}
