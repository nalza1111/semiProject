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

public class Product implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductService dao = new ProductServiceImpl();
		//제품정렬
		String job = request.getParameter("job");
		if(job!=null&&job.equals("search")) {
			list = dao.productSelectSortList(7);
			System.out.println(job);
		} else if (job!=null&&job.equals("date")) {
			list = dao.productSelectSortList(81);
			System.out.println(job);
		} else if (job!=null&&job.equals("lowPrice")) {//낮은가격부터
			list = dao.productSelectSortList(4);
			System.out.println(job);
		} else if (job!=null&&job.equals("highPrice")) {//높은가격부터
			list = dao.productSelectSortList(41);  //dao.productSelectSortListDesc(4); ==>이것은 필요 없고
			System.out.println(job);
		} else { // 정렬 조건 없는 메인화면
			//list = dao.productSelectList();
			list = dao.productSelectSortList(8);
		}
		request.setAttribute("list", list);
		for(ProductVO vo: list) {
			System.out.println(vo.getProductName());
		}
		//장바구니카운트용
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
		//장바구니카운트용
		
		return "product/productMain.tiles";
	}

}
