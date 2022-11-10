package co.bootjava.palette.cart.service;

import java.util.List;

import co.bootjava.palette.cart.CartVO;
import co.bootjava.palette.cart.UserOrderDetailVO;

public interface UserOrderDetailService {
	List<UserOrderDetailVO> userOrderDetailSelectList(UserOrderDetailVO vo);
	int userOrderDetailInsert(UserOrderDetailVO vo);
	int userOrderDetailDelete(UserOrderDetailVO vo);
	int userOrderDetailUpdatePlus(UserOrderDetailVO vo);
	int userOrderDetailUpdateMinus(UserOrderDetailVO vo);
}
