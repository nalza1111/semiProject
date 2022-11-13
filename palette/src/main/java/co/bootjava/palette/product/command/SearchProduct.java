package co.bootjava.palette.product.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.cart.service.CartService;
import co.bootjava.palette.cart.service.impl.CartServiceImpl;
import co.bootjava.palette.cart.vo.CartVO;
import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;
import co.bootjava.palette.product.vo.ProductVO;

public class SearchProduct implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String categoryCode = request.getParameter("categoryCode");
		categoryCode = categoryCode.toLowerCase();
		String search = request.getParameter("search");
		System.out.println(categoryCode+" "+search);
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductService dao = new ProductServiceImpl();
		
		ProductVO vo = new ProductVO("", categoryCode, search, "", "", "", "", "", "");
//		if(categoryCode.equals("all")) {
			list = dao.productSelectSearchList(vo);
//		} else {
//			list = dao.productListCategory(vo);
//		}
		
		request.setAttribute("list", list);
		
		//장바구니카운트용
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		//카트세션용
		CartService dao2 = new CartServiceImpl();
		if(id==null) {
			id="guest";
		}
		CartVO sessionCart = new CartVO("", "", "", "", id);
		List<CartVO> cartList = dao2.cartAccountSelectList(sessionCart);
		int cartCountNumber = 0;
		for(CartVO cart: cartList) {
			cartCountNumber = cartCountNumber + Integer.parseInt(cart.getProductCount());
			System.out.println(cart.getProductCount());
		}
		session.setAttribute("cartCountNumber", cartCountNumber);
		//장바구니카운트용
		
		return "product/productMain.tiles";
	}

}
