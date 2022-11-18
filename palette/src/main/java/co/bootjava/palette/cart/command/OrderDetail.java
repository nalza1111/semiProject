package co.bootjava.palette.cart.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		//프로덕트 상세
		List<ProductVO> orderProductList = new ArrayList<>();
		for(OrderVO v : list) {
			System.out.println(v.toString());
			ProductVO product = new ProductVO();
			product.setProductNumber(v.getProductNumber());
			System.out.println(v.getProductNumber());
			System.out.println(product.toString());
			ProductService dao3 = new ProductServiceImpl();
			product = dao3.productSelect(product);
			orderProductList.add(product);
		}
		List<Object> FinalList = new ArrayList<>();
		for(int i=0; i<list.size(); i++) {
			Map<String, String> map = new HashMap();
			map.put("orderNumber", list.get(i).getOrderNumber());
			map.put("productNumber", list.get(i).getProductNumber());
			map.put("productCount", list.get(i).getProductCount());
			map.put("productPrice", list.get(i).getProductPrice());
			map.put("image", orderProductList.get(i).getImage());
			map.put("productName", orderProductList.get(i).getProductName());
			FinalList.add(map);
		}
		
		//맵에 담아 이걸 사용
		request.setAttribute("FinalList", FinalList);
		//아래는 사용이 불편함
		request.setAttribute("list", list);
		request.setAttribute("orderProductList", orderProductList);
		return "order/orderDetail.tiles";
	}

}
