package co.bootjava.palette.order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.order.service.OrderService;
import co.bootjava.palette.order.service.impl.OrderServiceImpl;
import co.bootjava.palette.order.vo.OrderVO;

public class OrderDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		OrderService dao = new OrderServiceImpl();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		OrderVO order = new OrderVO();
		order.setId(id);
		int r = dao.orderDelete(order);
		
		return "ajax:"+r;
	}

}
