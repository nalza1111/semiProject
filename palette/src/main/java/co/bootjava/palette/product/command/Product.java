package co.bootjava.palette.product.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.ProductVO;
import co.bootjava.palette.product.service.ShopService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;

public class Product implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		ShopService dao = new ProductServiceImpl();
		list = dao.productSelectList();
		request.setAttribute("list", list);
		return "product/productMain";
	}

}
