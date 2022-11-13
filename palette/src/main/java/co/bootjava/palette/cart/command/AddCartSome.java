package co.bootjava.palette.cart.command;

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

public class AddCartSome implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String productNumber = request.getParameter("productNumber");
		String countBoxValue = request.getParameter("countBoxValue");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(productNumber+" "+countBoxValue+" "+id);
		CartService dao = new CartServiceImpl();
		CartVO searchCart = new CartVO("", productNumber, "", "", id);
		//이미 있는 카트인지 찾기
		CartVO searchCompleteCart = dao.cartSelect(searchCart);
		System.out.println(searchCompleteCart);
		System.out.println("======");
		int r=0;
		if(searchCompleteCart==null) { //없다면 새 카트 만들기
			
			//price찾기
			ProductService dao2 = new ProductServiceImpl();
			ProductVO product = new ProductVO(productNumber, null, null, null, null, null, null, null, null);
			product = dao2.productSelect(product);
			String productPrice = product.getProductPrice();
			
			CartVO cart = new CartVO("", productNumber, countBoxValue, productPrice, id);
			r = dao.cartInsertSome(cart);//price조인하기
			System.out.println("+생성완료"+r);
		} else {
			//이미 카트가 있으므로 +해주기
			searchCompleteCart.setProductCount(countBoxValue);//업데이트해줄갯수를 넣어주기(파라미터넘기기용)
			r = dao.cartUpdatePlusSome(searchCompleteCart);
			System.out.println("업데이트완료"+r);
		}
		return "ajax:"+r;
	}

}
