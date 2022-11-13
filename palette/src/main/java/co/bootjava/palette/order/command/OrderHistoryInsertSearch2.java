package co.bootjava.palette.order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.cart.service.CartService;
import co.bootjava.palette.cart.service.impl.CartServiceImpl;
import co.bootjava.palette.cart.vo.CartVO;
import co.bootjava.palette.common.Command;
import co.bootjava.palette.order.service.OrderHistoryService;
import co.bootjava.palette.order.service.OrderService;
import co.bootjava.palette.order.service.impl.OrderHistoryServiceImpl;
import co.bootjava.palette.order.service.impl.OrderServiceImpl;
import co.bootjava.palette.order.vo.OrderHistoryVO;
import co.bootjava.palette.order.vo.OrderVO;

public class OrderHistoryInsertSearch2 implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//오더히스토리 결제완료로 바꾸기
		OrderHistoryService dao = new OrderHistoryServiceImpl();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		OrderHistoryVO orderHistory = new OrderHistoryVO("", id, "", "", "", "", "");
		int r = dao.orderHistoryUpdateTF(orderHistory);
		//오더내역에 히스토리번호넣기
		orderHistory = dao.orderHistorySelectOne(orderHistory);
		String orderNumber = orderHistory.getOrderNumber();
		OrderService dao2 = new OrderServiceImpl();
		OrderVO order = new OrderVO();
		order.setId(id);
		order.setOrderNumber(orderNumber);
		int r2 = dao2.orderUpdate(order);
		//오더내역에 있는 거 카트내역지우기		
		CartService dao3 = new CartServiceImpl(); 
		CartVO cart = new CartVO();
		cart.setId(id);
		int r3 = dao3.cartDeleteOrder(cart);
		//히스토리생성
		return "ajax:"+"오더히스토리 결제완료"+r+"오더내역히스토리번호넣음"+r2+"오더내역에있던카트내역지움"+r3;
	}

}
