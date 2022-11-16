package co.bootjava.palette.product.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Parse;

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
		//제품정렬--dead code 정렬조건없는 메인화면 외에는 필요없어짐
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
		String categoryCode="all";
		
		int b01,b02,b03,b04,b05,b06,b07;
		b01 = b02 = b03 = b04 = b05 = b06 = b07 = 0;
		if(list.size()!=0) {

			int lowPrice, highPrice;
			lowPrice = Integer.parseInt(list.get(0).getProductPrice());
			highPrice = 0;
			for(ProductVO vo: list) {
				if( lowPrice >= Integer.parseInt(vo.getProductPrice()) ) {
					lowPrice =  Integer.parseInt(vo.getProductPrice());
				}
				if( highPrice <= Integer.parseInt(vo.getProductPrice())) {
					highPrice =  Integer.parseInt(vo.getProductPrice());
				}
				if(vo.getCategoryCode().equals("미술작품")) {
					b01++;
				} else if(vo.getCategoryCode().equals("조형물")) {
					b02++;
				} else if(vo.getCategoryCode().equals("사진")) {
					b03++;
				} else if(vo.getCategoryCode().equals("판화")) {
					b04++;
				}  else if(vo.getCategoryCode().equals("디지털 아트")) {
					b05++;
				} else if(vo.getCategoryCode().equals("콜라주")) {
					b06++;
				} else if(vo.getCategoryCode().equals("섬유 예술")) {
					b07++;
				} else {
					
				}

				request.setAttribute("lowPrice", lowPrice);
				request.setAttribute("highPrice", highPrice);
			}
		}
		request.setAttribute("allSum", list.size());
		request.setAttribute("b01", b01);
		request.setAttribute("b02", b02);
		request.setAttribute("b03", b03);
		request.setAttribute("b04", b04);
		request.setAttribute("b05", b05);
		request.setAttribute("b06", b06);
		request.setAttribute("b07", b07);
		
		//제품디테일에서 다시 카테고리검색함
		categoryCode=request.getParameter("categoryCode");
		System.out.println(categoryCode);
		if(categoryCode!=null&&!categoryCode.equals("all")) {
			categoryCode = request.getParameter("categoryCode");
			System.out.println(categoryCode);
			ProductVO vo = new ProductVO();
			vo.setCategoryCode(categoryCode);
			list = dao.productSelectSearchList(vo);
		}
		
		request.setAttribute("list", list);
		
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
