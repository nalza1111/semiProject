package co.bootjava.palette.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.command.AccountJoin;
import co.bootjava.palette.account.command.AccountJoinForm;
import co.bootjava.palette.account.command.AccountLogin;
import co.bootjava.palette.account.command.AccountLoginForm;
import co.bootjava.palette.account.command.AjaxIdCheck;
import co.bootjava.palette.account.command.EmailSend;
import co.bootjava.palette.account.command.FindPwForm;
import co.bootjava.palette.account.command.Logout;
import co.bootjava.palette.account.command.PwSend;
import co.bootjava.palette.board.command.BoardJoin;
import co.bootjava.palette.board.command.BoardJoinForm;
import co.bootjava.palette.board.command.BoardList;
import co.bootjava.palette.board.command.BoardMain;
import co.bootjava.palette.board.command.BoardSelect;
import co.bootjava.palette.board.command.BoardUpdate;
import co.bootjava.palette.board.command.BoardUpdateForm;
import co.bootjava.palette.cart.command.AddCart;
import co.bootjava.palette.cart.command.AddCartTwo;
import co.bootjava.palette.cart.command.CartForm;
import co.bootjava.palette.cart.command.DeleteCart;
import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.command.AddExhibitList;
import co.bootjava.palette.exhibit.command.AddExhibitListForm;
import co.bootjava.palette.exhibit.command.ExhibitContent;
import co.bootjava.palette.exhibit.command.ExhibitList;
import co.bootjava.palette.feed.command.FeedList;
import co.bootjava.palette.feed.command.FeedSelect;
import co.bootjava.palette.main.MainCommand;
import co.bootjava.palette.product.ProductVO;
import co.bootjava.palette.product.command.AddProduct;
import co.bootjava.palette.product.command.AddProductForm;
import co.bootjava.palette.product.command.Product;
import co.bootjava.palette.product.command.ProductDetail;
import co.bootjava.palette.product.command.ProductReset;
import co.bootjava.palette.product.command.ProductTest;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		//회원가입,로그인(천세훈)
		map.put("/main.do", new MainCommand());// 처음 보여줄 페이지 명령
		map.put("/accountJoinForm.do", new AccountJoinForm()); //회원가입
		map.put("/ajaxIdCheck.do", new AjaxIdCheck());	//아이디 중복 확인
		map.put("/emailSend.do", new EmailSend()); //이메일 전송
		map.put("/accountJoin.do", new AccountJoin()); //회원가입완료
		map.put("/accountLoginForm.do", new AccountLoginForm()); //로그인 화면
		map.put("/accountLogin.do", new AccountLogin()); //로그인 처리
		map.put("/findPwForm.do", new FindPwForm()); //비밀번호 찾기 화면
		map.put("/pwSend.do", new PwSend());
		map.put("/logout.do", new Logout()); //로그아웃처리
		
		//피드(김유리)
		map.put("/feedList.do", new FeedList()); // 피드 목록보기.
		map.put("/feedSelect.do", new FeedSelect()); // 피드 상세보기.
		
		//게시판(이재원)
		map.put("/boardList.do", new BoardList());
		map.put("/boardJoin.do", new BoardJoin());
		map.put("/boardMain.do", new BoardMain());// 게시판 메인화면
		map.put("/boardJoinForm.do", new BoardJoinForm());// 게시판 등록화면.
		map.put("/boardSelect.do", new BoardSelect());
		map.put("/boardUpdateForm.do", new BoardUpdateForm());
		map.put("/boardUpdate.do", new BoardUpdate());
		
		//전시회(정호경)
		map.put("/exhibitList.do", new ExhibitList()); // 전시 전체 목록
		map.put("/exhibitContent.do", new ExhibitContent()); // 상세페이지 조회
		map.put("/addExhibitListForm.do", new AddExhibitListForm()); // 리스트에 전시 추가폼	
		map.put("/addExhibitList.do", new AddExhibitList()); // 리스트에 전시 추가
		
		//쇼핑몰(허진주)
		
		map.put("/product.do", new Product()); //admin의 상점아이템 추가페이지로 이동.
		map.put("/addProductForm.do", new AddProductForm()); //상품추가서블릿
		map.put("/addProduct.do", new AddProduct()); //상품상세출력
		map.put("/productDetail.do", new ProductDetail());	//테스트용 두(json리스트보내기)
		map.put("/productTest.do", new ProductTest());	//메인화면장바구니추가
		map.put("/addCart.do", new AddCart());//장바구니추가(버튼)
		map.put("/cartForm.do", new CartForm());//장바구니버튼
		map.put("/addCartTwo.do", new AddCartTwo());//장바구니+-버튼
		map.put("/deleteCart.do", new DeleteCart());//장바구니 삭제 버튼
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		String uri = request.getRequestURI(); // 요청한 uri를 구함
		String contextPath = request.getContextPath();// 루트를 구함,context path
		String page = uri.substring(contextPath.length());// 실제 수행할 요청을 구함.
		Command command = map.get(page); // init 메소드에서 수행할 명령을 가져온다.
		
		System.out.println(page);
//		Command command=new MainCommand();

		String viewPage = command.exec(request, response);// 명령을 수행하고 결과를 돌려받음.
		//전체상품리스트불러옴
		List<ProductVO> list = (List<ProductVO>) request.getAttribute("list");
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
				viewPage.substring(5);
				viewPage="/WEB-INF/views/"+viewPage+".jsp";//타일즈 안태움
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect(viewPage);//*.do 로 들어올때 돌아가는 곳.
		}
	}

}
