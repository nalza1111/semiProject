package co.bootjava.palette.product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.ProductVO;
import co.bootjava.palette.product.service.ShopService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;

public class ProductDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String productNumber = (String) request.getParameter("productNumber");
		ShopService dao = new ProductServiceImpl();
		ProductVO product = new ProductVO(productNumber, null, null, null, null, null, null, null, null);
		product = dao.productSelect(product);
		request.setAttribute("product", product);
		return "product/productDetailForm";
	}

}
