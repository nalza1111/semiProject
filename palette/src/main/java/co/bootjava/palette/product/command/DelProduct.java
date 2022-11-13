package co.bootjava.palette.product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;
import co.bootjava.palette.product.vo.ProductVO;

public class DelProduct implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String productNumber = request.getParameter("productNumber");
		ProductVO product = new ProductVO(productNumber,
											"",
											"",
											"",
											"",
											"",
											"",
											"",
											"");
		ProductService dao = new ProductServiceImpl();
		int productTest = dao.productDelete(product);
		return "product/indexProduct.tiles";
	}

}
