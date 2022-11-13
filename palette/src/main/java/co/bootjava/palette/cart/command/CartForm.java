package co.bootjava.palette.cart.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.cart.service.UserOrderDetailService;
import co.bootjava.palette.cart.service.impl.UserOrderDetailServiceImpl;
import co.bootjava.palette.cart.vo.UserOrderDetailVO;
import co.bootjava.palette.common.Command;

public class CartForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserOrderDetailVO vo = new UserOrderDetailVO("", "", "", "", "",id);
		
		System.out.println("cartform.do test" + vo.toString());
		
		UserOrderDetailService dao = new UserOrderDetailServiceImpl();
		List<UserOrderDetailVO> userOrderDetailList = dao.userOrderDetailSelectList(vo);
		System.out.println("카트로 넘어가면서 장바구니 목록 보임");
		for(UserOrderDetailVO v:userOrderDetailList) {
			System.out.println(v.toString());
		}
		session.setAttribute("userOrderDetailList", userOrderDetailList);
		
		return "cart/cartForm.tiles";
	}

}
