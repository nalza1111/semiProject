package co.bootjava.palette.cart.service;

import java.util.List;

import co.bootjava.palette.cart.vo.CartVO;

public interface CartService {
	List<CartVO> cartSelectList();
	List<CartVO> cartAccountSelectList(CartVO vo);
	CartVO cartSelect(CartVO vo);
	int cartInsert(CartVO vo); //첫장바구니 카운트수1
	int cartDelete(CartVO vo);
	int cartUpdatePlus(CartVO vo);
	int cartUpdateMinus(CartVO vo);
	
	int cartInsertSome(CartVO vo); //첫장바구니 카운트수지정
	int cartUpdatePlusSome(CartVO vo);//기존장바구니 카운트수추가
	
	int cartDeleteOrder(CartVO vo);
}
