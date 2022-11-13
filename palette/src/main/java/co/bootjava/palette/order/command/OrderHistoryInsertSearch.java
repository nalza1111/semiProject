package co.bootjava.palette.order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.order.service.OrderHistoryService;
import co.bootjava.palette.order.service.impl.OrderHistoryServiceImpl;
import co.bootjava.palette.order.vo.OrderHistoryVO;

public class OrderHistoryInsertSearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		OrderHistoryService dao = new OrderHistoryServiceImpl();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String address = (String)request.getParameter("address");
		String tel = (String)request.getParameter("phone");
		String name = (String)request.getParameter("name");
		System.out.println(address);
		OrderHistoryVO orderHistory = new OrderHistoryVO("", id, "", address, name, tel, "");
		dao.orderHistoryInsert(orderHistory);
		
		orderHistory = dao.orderHistorySelectOne(orderHistory);
		
		
		return "ajax:"+orderHistory.getOrderNumber();
	}

}
