package co.bootjava.palette.cart.mapper;

import java.util.List;

import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.cart.vo.UserOrderDetailVO;

public interface UserOrderDetailMapper {
	List<UserOrderDetailVO> userOrderDetailSelectList(UserOrderDetailVO vo); //카트에 띄울 때
	int userOrderDetailInsert(UserOrderDetailVO vo);
	int userOrderDetailDelete(UserOrderDetailVO vo);
	int userOrderDetailUpdatePlus(UserOrderDetailVO vo);
	int userOrderDetailUpdateMinus(UserOrderDetailVO vo);
	
	AccountVO selectId(String id); //결제시 아이디 조회
}
