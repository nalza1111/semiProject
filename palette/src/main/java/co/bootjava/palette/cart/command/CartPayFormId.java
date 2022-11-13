package co.bootjava.palette.cart.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.cart.service.UserOrderDetailService;
import co.bootjava.palette.cart.service.impl.UserOrderDetailServiceImpl;
import co.bootjava.palette.cart.vo.UserOrderDetailVO;
import co.bootjava.palette.common.Command;

public class CartPayFormId implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		UserOrderDetailService dao = new UserOrderDetailServiceImpl();
	
		//매핑
		ObjectMapper objectMapper = new ObjectMapper();
		
		//결제자정보가져오기 아이디, 메일, 이름, 전화번호, 주소, 우편번호 결제폼에 뿌려주고..입력받은거 사용하기
		AccountVO account = dao.selectId(id);
		request.setAttribute("account", account);
		String payAccount = "";
		try {
			payAccount = objectMapper.writeValueAsString(account);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.println(payAccount);
		return "ajax:"+payAccount;
	}

}
