package co.bootjava.palette.order.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import co.bootjava.palette.common.Command;
import co.bootjava.palette.order.service.OrderHistoryService;
import co.bootjava.palette.order.service.impl.OrderHistoryServiceImpl;
import co.bootjava.palette.order.vo.OrderHistoryVO;

public class OrderHistory implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//오더히스토리
		OrderHistoryService dao = new OrderHistoryServiceImpl();
		
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		List<OrderHistoryVO> list = new ArrayList<>();
		if (role.equals("admin")) { //role이 어드민이면 모든 리스트
			list = dao.orderHistoryList();
			request.setAttribute("list", list);
		} else {
			String id = (String) session.getAttribute("id");
			OrderHistoryVO vo = new OrderHistoryVO();
			vo.setId(id);
			list = dao.orderHistoryPerList(vo);
			request.setAttribute("list", list);
		}
		return "order/orderHistory.tiles";
	}

}
