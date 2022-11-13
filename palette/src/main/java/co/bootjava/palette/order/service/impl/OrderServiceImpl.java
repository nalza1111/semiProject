package co.bootjava.palette.order.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.common.DataSource;
import co.bootjava.palette.order.mapper.OrderMapper;
import co.bootjava.palette.order.service.OrderService;
import co.bootjava.palette.order.vo.OrderVO;

public class OrderServiceImpl implements OrderService{
	private SqlSession SqlSession = DataSource.getInstance().openSession(true);
	private OrderMapper map = SqlSession.getMapper(OrderMapper.class);
	
	@Override
	public int orderInsert(OrderVO vo) {
		return map.orderInsert(vo);
	}

	@Override
	public int orderUpdate(OrderVO vo) {
		return map.orderUpdate(vo);
	}

	@Override
	public int orderDelete(OrderVO vo) {
		return map.orderDelete(vo);
	}

	@Override
	public List<OrderVO> selectOrderOne(OrderVO vo) {
		return map.selectOrderOne(vo);//상세조회;
	}

}
