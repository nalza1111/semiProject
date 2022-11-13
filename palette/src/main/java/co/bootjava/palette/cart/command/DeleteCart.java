package co.bootjava.palette.cart.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.cart.service.CartService;
import co.bootjava.palette.cart.service.impl.CartServiceImpl;
import co.bootjava.palette.cart.vo.CartVO;
import co.bootjava.palette.common.Command;

public class DeleteCart implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String productNumber = request.getParameter("productNumber");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		CartService dao = new CartServiceImpl();
		CartVO searchCart = new CartVO("", productNumber, "", "", id);
		int r = dao.cartDelete(searchCart);
		return "ajax:"+r;
	}

}
