package co.bootjava.palette.product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;
import co.bootjava.palette.product.vo.ProductVO;

public class UpDelProductForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String productNumber = (String) request.getParameter("productNumber");
		ProductService dao = new ProductServiceImpl();
		ProductVO product = new ProductVO(productNumber, null, null, null, null, null, null, null, null);
		
		//상세서치
		product = dao.productSelect(product);
		request.setAttribute("product", product);	
		
		return "product/upDelProductForm.tiles";
	}

}
