package co.bootjava.palette.cart.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.order.service.OrderService;
import co.bootjava.palette.order.service.impl.OrderServiceImpl;
import co.bootjava.palette.order.vo.OrderVO;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;
import co.bootjava.palette.product.vo.ProductVO;

public class OrderDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//뿌리기용
		String orderNumber = request.getParameter("orderNumber");
		String orderDate = request.getParameter("orderDate");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String payDo = request.getParameter("payDo");
		System.out.println(orderNumber+" "+orderDate+" "+address+" "+name+" "+payDo+" "+tel);
		request.setAttribute("orderNumber", orderNumber);
		request.setAttribute("orderDate", orderDate);
		request.setAttribute("address", address);
		request.setAttribute("name", name);
		request.setAttribute("payDo", payDo);
		request.setAttribute("tel", tel);
		//상세주문내역
		OrderService dao = new OrderServiceImpl();
		OrderVO vo = new OrderVO();
		vo.setOrderNumber(orderNumber);
		
		List<OrderVO> list = dao.selectOrderOne(vo);
		
		request.setAttribute("list", list);
		//프로덕트 상세
		List<ProductVO> orderProductList = new ArrayList<>();
		for(OrderVO v : list) {
			ProductVO product = new ProductVO();
			product.setProductNumber(v.getProductNumber());
			ProductService dao3 = new ProductServiceImpl();
			orderProductList.add(dao3.productSelect(product));
		}
		request.setAttribute("orderProductList", orderProductList);
		return "order/orderDetail.tiles";
	}

}
