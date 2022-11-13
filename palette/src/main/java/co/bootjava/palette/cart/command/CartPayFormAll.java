package co.bootjava.palette.cart.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.bootjava.palette.cart.service.UserOrderDetailService;
import co.bootjava.palette.cart.service.impl.UserOrderDetailServiceImpl;
import co.bootjava.palette.cart.vo.UserOrderDetailVO;
import co.bootjava.palette.common.Command;
import co.bootjava.palette.order.service.OrderHistoryService;
import co.bootjava.palette.order.service.OrderService;
import co.bootjava.palette.order.service.impl.OrderHistoryServiceImpl;
import co.bootjava.palette.order.service.impl.OrderServiceImpl;
import co.bootjava.palette.order.vo.OrderHistoryVO;
import co.bootjava.palette.order.vo.OrderVO;

public class CartPayFormAll implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserOrderDetailVO vo = new UserOrderDetailVO("", "", "", "", "", id);

		System.out.println("모든 결제창으로 이동...cartPayForm.do test" + id);

		UserOrderDetailService dao = new UserOrderDetailServiceImpl();
		List<UserOrderDetailVO> userOrderDetailList = dao.userOrderDetailSelectList(vo);
		System.out.println("결제창으로 이동 장바구니 목록 보임");
		OrderService oderDao = new OrderServiceImpl();
		for (UserOrderDetailVO v : userOrderDetailList) {
			System.out.println(v.toString());
			OrderVO order = new OrderVO();
			order.setId(v.getId());
			order.setProductCount(v.getProductCount());
			order.setProductNumber(v.getProductNumber());
			order.setProductPrice(v.getProductPrice());
			oderDao.orderInsert(order);
		}
		
		// 매핑
		ObjectMapper objectMapper = new ObjectMapper();
		String lists = "";
		try {
			lists = objectMapper.writeValueAsString(userOrderDetailList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.println("결제모달로 이동 -> 매핑test :" + lists);
		
		//DB미결제지움
		OrderHistoryService ser = new OrderHistoryServiceImpl();
		OrderHistoryVO orderHistory = new OrderHistoryVO();
		orderHistory.setId(id);
		ser.orderHistoryDelete(orderHistory);
		
		return "ajax:" + lists;

	}

}
