package co.bootjava.palette.cart.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.bootjava.palette.account.vo.AccountVO;
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

public class CartPayForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String payCart = request.getParameter("payCart");
		System.out.println(payCart);
		if(payCart != "") {
		String arr[]= payCart.split("_");
		System.out.println(Arrays.toString(arr));
		System.out.println(arr.length);
		List<UserOrderDetailVO> userOrderDetailListPay = new ArrayList<UserOrderDetailVO>();
		UserOrderDetailService dao = new UserOrderDetailServiceImpl();
		OrderService oderDao = new OrderServiceImpl();
		for(int i=0; i<arr.length; i++) {
			System.out.println(arr[i]);
			System.out.println(i+"번째 돌고있음");
			UserOrderDetailVO vo = new UserOrderDetailVO(arr[i], "", "", "", "",id);
			List<UserOrderDetailVO> list = dao.userOrderDetailSelectList(vo);
			System.out.println("vo리스트 돌려온 리스트에서 0번째"+list.get(0).toString());
			
			//오더에 미리 넣어둠..(계산안된주문량)
			OrderVO order = new OrderVO();
			order.setId(list.get(0).getId());
			order.setProductCount(list.get(0).getProductCount());
			order.setProductNumber(list.get(0).getProductNumber());
			order.setProductPrice(list.get(0).getProductPrice());
			oderDao.orderInsert(order);
			
			userOrderDetailListPay.add(list.get(0));
		}
		for(UserOrderDetailVO v:userOrderDetailListPay) {
		System.out.println("최종 주문 리스트"+v.toString());
		}
		//매핑
		ObjectMapper objectMapper = new ObjectMapper();
		String lists = "";
		try {
			lists = objectMapper.writeValueAsString(userOrderDetailListPay);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.println("결제모달로 이동 -> 매핑test :"+lists);

		//DB미결제지움
		OrderHistoryService ser = new OrderHistoryServiceImpl();
		OrderHistoryVO orderHistory = new OrderHistoryVO();
		orderHistory.setId(id);
		ser.orderHistoryDelete(orderHistory);
		
		
		return "ajax:"+ lists;
		} else {
			return "ajax:"+ "";
		}
	}

}
