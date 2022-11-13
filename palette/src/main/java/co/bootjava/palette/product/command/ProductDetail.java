package co.bootjava.palette.product.command;

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

public class ProductDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String productNumber = (String) request.getParameter("productNumber");
		ProductService dao = new ProductServiceImpl();
		ProductVO product = new ProductVO(productNumber, null, null, null, null, null, null, null, null);
		

		//조회수올리기
		dao.productUpdateHit(product);		
		//상세서치
		product = dao.productSelect(product);
		request.setAttribute("product", product);

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
		
		return "product/productDetailForm.tiles";
	}

}
