package co.bootjava.palette.cart.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.cart.mapper.UserOrderDetailMapper;
import co.bootjava.palette.cart.service.UserOrderDetailService;
import co.bootjava.palette.cart.vo.UserOrderDetailVO;
import co.bootjava.palette.common.DataSource;

public class UserOrderDetailServiceImpl implements UserOrderDetailService {
	private SqlSession SqlSession = DataSource.getInstance().openSession(true);
	private UserOrderDetailMapper map = SqlSession.getMapper(UserOrderDetailMapper.class);

	@Override
	public List<UserOrderDetailVO> userOrderDetailSelectList(UserOrderDetailVO vo) {
		return map.userOrderDetailSelectList(vo);
	}

	@Override
	public int userOrderDetailInsert(UserOrderDetailVO vo) {
		return map.userOrderDetailInsert(vo);
	}

	@Override
	public int userOrderDetailDelete(UserOrderDetailVO vo) {
		return map.userOrderDetailDelete(vo);
	}

	@Override
	public int userOrderDetailUpdatePlus(UserOrderDetailVO vo) {
		return map.userOrderDetailUpdatePlus(vo);
	}

	@Override
	public int userOrderDetailUpdateMinus(UserOrderDetailVO vo) {
		return map.userOrderDetailUpdateMinus(vo);
	}

	@Override
	public AccountVO selectId(String id) {
		return map.selectId(id);
	}

}
