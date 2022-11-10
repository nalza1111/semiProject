package co.bootjava.palette.cart.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.cart.CartVO;
import co.bootjava.palette.cart.service.CartService;
import co.bootjava.palette.cart.service.impl.CartServiceImpl;
import co.bootjava.palette.common.Command;

public class AddCart implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("addCart넘어옴");
		String productNumber = request.getParameter("productNumber");
		String productPrice = request.getParameter("productPrice");
		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("id");
		System.out.println(account+" "+productNumber+" "+productPrice);
		
		CartService dao = new CartServiceImpl();
		//세션에 카트가 있을 수 있으니 (물건번호와 계정을 사용해 DB의 카트를 불러옴)
		CartVO searchCart = new CartVO("", productNumber, "", "", account);
		CartVO searchCompleteCart = dao.cartSelect(searchCart);
		if(searchCompleteCart==null) { //새 카트 만들기
			CartVO cart = new CartVO("", productNumber, "", productPrice, account);
			int r = dao.cartInsert(cart);
			System.out.println("+생성완료"+r);
		} else {
			//이미 카트가 있으므로 +1
			int r = dao.cartUpdatePlus(searchCompleteCart);
			System.out.println("+1완료"+r);
		}
		CartVO sessionCart = new CartVO("", "", "", "", account);
		List<CartVO> cartList = dao.cartAccountSelectList(sessionCart);
		int cartCountNumber = 0;
		for(CartVO cart: cartList) {
			cartCountNumber = cartCountNumber + Integer.parseInt(cart.getProductCount());
			System.out.println(cart.getProductCount());
		}
		session.setAttribute("cartCountNumber", cartCountNumber);
		return "product/indexProduct.tiles";
	}

}
