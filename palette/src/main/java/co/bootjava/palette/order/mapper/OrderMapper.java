package co.bootjava.palette.order.mapper;

import java.util.List;

import co.bootjava.palette.order.vo.OrderVO;

public interface OrderMapper {
	int orderInsert(OrderVO vo);//처음에 주문번호없는 거 카트에서 넣어줌
	int orderUpdate(OrderVO vo);//결제완료 후 넣어줌
	int orderDelete(OrderVO vo);//결제취소시 삭제
	
	List<OrderVO> selectOrderOne(OrderVO vo);//상세조회
}
