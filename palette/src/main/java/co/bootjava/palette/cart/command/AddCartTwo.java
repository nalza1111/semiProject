package co.bootjava.palette.cart.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.cart.service.CartService;
import co.bootjava.palette.cart.service.impl.CartServiceImpl;
import co.bootjava.palette.cart.vo.CartVO;
import co.bootjava.palette.common.Command;

public class AddCartTwo implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//productNumber="+productNumber+"id="+id+"job="+job
		String productNumber = request.getParameter("productNumber");
		String job = request.getParameter("job");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		CartService dao = new CartServiceImpl();
		CartVO searchCart = new CartVO("", productNumber, "", "", id);
		CartVO searchCompleteCart = dao.cartSelect(searchCart);
		int r = 0;
		if(job.equals("plus")) {
			r = dao.cartUpdatePlus(searchCompleteCart);
			System.out.println("+1완료"+r);
		} else if(job.equals("minus")) {
			r = dao.cartUpdateMinus(searchCompleteCart);
			System.out.println("-1완료"+r);
		}
		return "ajax:"+r;
	}

}
