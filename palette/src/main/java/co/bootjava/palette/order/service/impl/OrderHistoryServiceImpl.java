package co.bootjava.palette.order.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.common.DataSource;
import co.bootjava.palette.order.mapper.OrderHistoryMapper;
import co.bootjava.palette.order.service.OrderHistoryService;
import co.bootjava.palette.order.vo.OrderHistoryVO;

public class OrderHistoryServiceImpl implements OrderHistoryService{
	private SqlSession SqlSession = DataSource.getInstance().openSession(true);
	private OrderHistoryMapper map = SqlSession.getMapper(OrderHistoryMapper.class);
			
	@Override
	public int orderHistoryInsert(OrderHistoryVO vo) {
		return map.orderHistoryInsert(vo);
	}

	@Override
	public OrderHistoryVO orderHistorySelectOne(OrderHistoryVO vo) {
		return map.orderHistorySelectOne(vo);
	}

	@Override
	public int orderHistoryUpdate(OrderHistoryVO vo) {
		return map.orderHistoryUpdate(vo);//결제완료1-0;
	}

	@Override
	public int orderHistoryDelete(OrderHistoryVO vo) {
		return 	map.orderHistoryDelete(vo);
	}

	@Override
	public int orderHistoryUpdateTF(OrderHistoryVO vo) {
		return 	map.orderHistoryUpdateTF(vo);
	}

	@Override
	public List<OrderHistoryVO> orderHistoryList() {
		return 	map.orderHistoryList();//관리자의 경우 전체 일반회원의 경우 일부만 나오게
	}

	@Override
	public List<OrderHistoryVO> orderHistoryPerList(OrderHistoryVO vo) {
		return map.orderHistoryPerList(vo);
	}

}
