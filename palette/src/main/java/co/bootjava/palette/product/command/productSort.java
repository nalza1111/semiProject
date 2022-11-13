package co.bootjava.palette.product.command;

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

public class productSort implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductService dao = new ProductServiceImpl();
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
