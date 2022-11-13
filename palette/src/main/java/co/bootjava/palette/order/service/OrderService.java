package co.bootjava.palette.order.service;

import java.util.List;

import co.bootjava.palette.order.vo.OrderVO;

public interface OrderService {
	int orderInsert(OrderVO vo);//처음에 주문번호없이 카트에서 넣어줌
	int orderUpdate(OrderVO vo);//결제완료시 주문번호넣기
	int orderDelete(OrderVO vo);//결제취소시 삭제
	
	List<OrderVO> selectOrderOne(OrderVO vo);//상세조회
}
