package co.bootjava.palette.product.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.cart.CartVO;
import co.bootjava.palette.cart.service.CartService;
import co.bootjava.palette.cart.service.impl.CartServiceImpl;
import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.ProductVO;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;

public class Product implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		System.out.println("1");
		ProductService dao = new ProductServiceImpl();
		list = dao.productSelectList();
		request.setAttribute("list", list);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		//카트세션용
		CartService dao2 = new CartServiceImpl();
		CartVO sessionCart = new CartVO("", "", "", "", id);
		List<CartVO> cartList = dao2.cartAccountSelectList(sessionCart);
		int cartCountNumber = 0;
		for(CartVO cart: cartList) {
			cartCountNumber = cartCountNumber + Integer.parseInt(cart.getProductCount());
			System.out.println(cart.getProductCount());
		}
		session.setAttribute("cartCountNumber", cartCountNumber);
		
		return "product/productMain.tiles";
	}

}
