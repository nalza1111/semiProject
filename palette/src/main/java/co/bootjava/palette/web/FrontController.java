package co.bootjava.palette.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.main.MainCommand;
import co.bootjava.palette.shop.command.AddProduct;
import co.bootjava.palette.shop.command.AddProductForm;
import co.bootjava.palette.shop.command.Shop;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainCommand());
		//상점페이지로 이동
		map.put("/shop.do", new Shop());
		//admin의 상점아이템 추가페이지로 이동.
		map.put("/addProductForm.do", new AddProductForm());
		//상품추가서블릿
		map.put("/addProduct.do", new AddProduct());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length());

		Command command = map.get(page);
//		Command command=new MainCommand();

		String viewPage = command.exec(request, response);
		//viewResolve 파트
		if(!viewPage.endsWith(".do")&&viewPage!=null) {
			//ajax 처리		
			if(viewPage.startsWith("ajax:")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(viewPage.substring(5));
				return;
			}
			//타일즈 돌아가는곳	
			if(!viewPage.endsWith(".tiles")) {
				viewPage="/WEB-INF/views/"+viewPage+".jsp";//타일즈 안태움
			}			
			RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect(viewPage);//*.do 로 들어올때 돌아가는 곳.
		}
	}

}
