package co.bootjava.palette.product.commandr;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;
import co.bootjava.palette.product.vo.ProductVO;

public class SearchProductBtn implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductService dao = new ProductServiceImpl();
		
		String job = request.getParameter("job");
		ProductVO vo = new ProductVO("", job, "", "", "", "", "", "", "");
		list = dao.productSelectSearchList(vo);
		ObjectMapper objectMapper = new ObjectMapper();
		String lists = "";
		try {
			lists = objectMapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:"+ lists;
	}

}
