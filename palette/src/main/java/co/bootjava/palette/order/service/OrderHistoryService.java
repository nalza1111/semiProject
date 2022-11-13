package co.bootjava.palette.order.service;

import java.util.List;

import co.bootjava.palette.order.vo.OrderHistoryVO;

public interface OrderHistoryService {
	int orderHistoryInsert(OrderHistoryVO vo);//주문 시도시 생성
	OrderHistoryVO orderHistorySelectOne(OrderHistoryVO vo);// 방금생성한 주문번호찾기
	int orderHistoryUpdate(OrderHistoryVO vo);//결제완료1-0
	int orderHistoryDelete(OrderHistoryVO vo);//결제취소되고 삭제함(널인거)
	int orderHistoryUpdateTF(OrderHistoryVO vo); // 결제완료된것 히스토리 결제 업데이트
	
	List<OrderHistoryVO> orderHistoryList();//관리자의 경우 전체
	List<OrderHistoryVO> orderHistoryPerList(OrderHistoryVO vo);//일반회원의 경우 일부만 나오게

}
