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

import co.bootjava.palette.account.command.AccountDelete;
import co.bootjava.palette.account.command.AccountJoin;
import co.bootjava.palette.account.command.AccountJoinForm;
import co.bootjava.palette.account.command.AccountLogin;
import co.bootjava.palette.account.command.AccountLoginForm;
import co.bootjava.palette.account.command.AjaxIdCheck;
import co.bootjava.palette.account.command.EmailSend;
import co.bootjava.palette.account.command.FindPwForm;
import co.bootjava.palette.account.command.Logout;
import co.bootjava.palette.account.command.ManageSite;
import co.bootjava.palette.account.command.PwSend;
import co.bootjava.palette.art.command.ArtDelete;
import co.bootjava.palette.art.command.ArtInsert;
import co.bootjava.palette.art.command.ArtInsertForm;
import co.bootjava.palette.art.command.ViewCntPlus;
import co.bootjava.palette.board.command.BoardBan;
import co.bootjava.palette.board.command.BoardDelete;
import co.bootjava.palette.board.command.BoardDetailList;
import co.bootjava.palette.board.command.BoardJoin;
import co.bootjava.palette.board.command.BoardJoinForm;
import co.bootjava.palette.board.command.BoardList;
import co.bootjava.palette.board.command.BoardMain;
import co.bootjava.palette.board.command.BoardSelect;
import co.bootjava.palette.board.command.BoardSelectSession;
import co.bootjava.palette.board.command.BoardUpdate;
import co.bootjava.palette.board.command.BoardUpdateForm;
import co.bootjava.palette.board.command.MyBoardList;
import co.bootjava.palette.cart.command.AddCart;
import co.bootjava.palette.cart.command.AddCartSome;
import co.bootjava.palette.cart.command.AddCartTwo;
import co.bootjava.palette.cart.command.CartForm;
import co.bootjava.palette.cart.command.CartPayForm;
import co.bootjava.palette.cart.command.CartPayFormAll;
import co.bootjava.palette.cart.command.CartPayFormId;
import co.bootjava.palette.cart.command.DeleteCart;
import co.bootjava.palette.cart.command.OrderDetail;
import co.bootjava.palette.common.Command;
import co.bootjava.palette.exhibit.command.AddExhibitList;
import co.bootjava.palette.exhibit.command.AddExhibitListForm;
import co.bootjava.palette.exhibit.command.ContentUpdate;
import co.bootjava.palette.exhibit.command.ContentUpdateForm;
import co.bootjava.palette.exhibit.command.DeleteContent;
import co.bootjava.palette.exhibit.command.DeleteContentForm;
import co.bootjava.palette.exhibit.command.ExhibitContent;
import co.bootjava.palette.exhibit.command.ExhibitList;
import co.bootjava.palette.exhibit.command.IngList;
import co.bootjava.palette.feed.command.FeedAddListForm;
import co.bootjava.palette.feed.command.FeedList;
import co.bootjava.palette.feed.command.FeedSelect;
import co.bootjava.palette.feed.command.IsFeedExist;
import co.bootjava.palette.feed.command.MyFeed;
import co.bootjava.palette.feed.command.UpdateFollow;
import co.bootjava.palette.main.MainCommand;
import co.bootjava.palette.order.command.OrderComplete;
import co.bootjava.palette.order.command.OrderDelete;
import co.bootjava.palette.order.command.OrderHistory;
import co.bootjava.palette.order.command.OrderHistoryInsertSearch;
import co.bootjava.palette.order.command.OrderHistoryInsertSearch2;
import co.bootjava.palette.product.command.AddProduct;
import co.bootjava.palette.product.command.AddProductForm;
import co.bootjava.palette.product.command.DelProduct;
import co.bootjava.palette.product.command.Product;
import co.bootjava.palette.product.command.ProductDetail;
import co.bootjava.palette.product.command.ProductTest;
import co.bootjava.palette.product.command.SearchProduct;
import co.bootjava.palette.product.command.UpDelProduct;
import co.bootjava.palette.product.command.UpDelProductForm;
import co.bootjava.palette.product.command.productSort;
import co.bootjava.palette.product.commandr.SearchProductBtn;
import co.bootjava.palette.reply.command.ReplyDelete;
import co.bootjava.palette.reply.command.ReplyJoin;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		
		map.put("/main.do", new MainCommand());// 처음 보여줄 페이지 명령
		
		//회원가입,로그인(천세훈)
		map.put("/accountJoinForm.do", new AccountJoinForm()); //회원가입
		map.put("/ajaxIdCheck.do", new AjaxIdCheck());	//아이디 중복 확인
		map.put("/emailSend.do", new EmailSend()); //이메일 전송
		map.put("/accountJoin.do", new AccountJoin()); //회원가입완료
		map.put("/accountLoginForm.do", new AccountLoginForm()); //로그인 화면
		map.put("/accountLogin.do", new AccountLogin()); //로그인 처리
		map.put("/findPwForm.do", new FindPwForm()); //비밀번호 찾기 화면
		map.put("/pwSend.do", new PwSend());  //비밀번호 메일전송
		map.put("/logout.do", new Logout()); //로그아웃처리
		
		//피드(김유리)
		map.put("/feedList.do", new FeedList()); // 피드 목록보기.
		map.put("/feedSelect.do", new FeedSelect()); // 피드 상세보기.
		map.put("/updateFollow.do", new UpdateFollow()); //팔로우 +1 증가.
		map.put("/feedAddListForm.do", new FeedAddListForm()); // 리스트에 피드 추가폼
		map.put("/isFeedExist.do", new IsFeedExist()); //피드 유무 체크
		map.put("/myFeed.do", new MyFeed());	//내 피드가기
		map.put("/artInsertForm.do", new ArtInsertForm()); //내 작품 추가 화면
		map.put("/artInsert.do", new ArtInsert()); //내 작품 추가
		map.put("/viewCntPlus.do", new ViewCntPlus()); //작품 조회수 추가
		map.put("/artDelete.do", new ArtDelete()); //내 작품 삭제
		map.put("/manageSite.do", new ManageSite()); //관리자 페이지
		map.put("/accountDelete.do", new AccountDelete()); //계정삭제
		
		//게시판(이재원)
		map.put("/boardList.do", new BoardList()); //게시물 목록기능
		map.put("/boardMain.do", new BoardMain()); // 게시판 메인화면
		map.put("/boardJoinForm.do", new BoardJoinForm()); // 게시판 등록화면.
		map.put("/boardSelect.do", new BoardSelect()); //게시물 한건조회하는 기능.
		map.put("/boardJoin.do", new BoardJoin()); //게시물 등록기능.
		map.put("/boardUpdateForm.do", new BoardUpdateForm()); //게시물 수정화면이동.
		map.put("/boardUpdate.do", new BoardUpdate()); //게시물 수정기능.
		map.put("/boardDelete.do", new BoardDelete()); //게시물 삭제기능.
		map.put("/replyJoin.do", new ReplyJoin()); //댓글작성기능.
		map.put("/boardDetailList.do", new BoardDetailList()); //검색리스트보여주는기능.
		map.put("/boardSelectSession.do", new BoardSelectSession()); //댓글작성시 데이터손실방지 세션에 저장.
		map.put("/myBoardList.do", new MyBoardList()); //나의게시물목록기능.
		map.put("/boardBan.do", new BoardBan()); //신고기능.
		map.put("/replyDelete.do", new ReplyDelete());
		
		//전시회(정호경)
		map.put("/exhibitList.do", new ExhibitList()); // 전시 전체 목록
		map.put("/exhibitContent.do", new ExhibitContent()); // 상세페이지 조회
		map.put("/addExhibitListForm.do", new AddExhibitListForm()); // 리스트에 전시 추가폼 (관리자)	
		map.put("/addExhibitList.do", new AddExhibitList()); // 리스트에 전시 추가 (관리자)
		map.put("/contentUpdateForm.do", new ContentUpdateForm()); // 전시글 수정폼 (관리자)
		map.put("/contentUpdate.do", new ContentUpdate()); // 전시글 수정 (관리자)
		map.put("/deleteContentForm.do", new DeleteContentForm()); // 전시글 삭제폼 (관리자)
		map.put("/deleteContent.do", new DeleteContent()); // 전시글 삭제 (관리자)
		map.put("/ingList.do", new IngList()); // 현재 전시만 보여주기
		
		//쇼핑몰(허진주)
		map.put("/product.do", new Product()); //메인
		map.put("/productSort.do", new productSort()); //서치정렬뿌려주기
		map.put("/addProductForm.do", new AddProductForm()); //상품추가서블릿
		map.put("/addProduct.do", new AddProduct()); //상품추가
		map.put("/productDetail.do", new ProductDetail());	//제품상세페이지
		map.put("/productTest.do", new ProductTest());	//테스트
		map.put("/addCart.do", new AddCart());//장바구니추가(버튼)
		map.put("/cartForm.do", new CartForm());//장바구니버튼
		map.put("/addCartTwo.do", new AddCartTwo());//장바구니+-버튼
		map.put("/deleteCart.do", new DeleteCart());//장바구니 삭제 버튼
		map.put("/addCartSome.do", new AddCartSome());//제품상세페이지에서 제품추가
		map.put("/searchProduct.do", new SearchProduct());//제품페이지에서 검색
		map.put("/searchProductBtn.do", new SearchProductBtn());//제품페이지에서 글누르고 카테고리검색
		map.put("/upDelProductForm.do", new UpDelProductForm());//제품수정폼으로 이동
		map.put("/upDelProduct.do", new UpDelProduct());//제품수정
		map.put("/delProduct.do", new DelProduct());//제품삭제
		map.put("/cartPayForm.do", new CartPayForm());//결제창으로 리스트뽑아오기 +오더컴플리트에상품넣음(비결제)
		map.put("/cartPayFormAll.do", new CartPayFormAll());//결제창으로 리스트뽑아오기 +오더컴플리트에상품넣음(비결제) + db미결제지움
		map.put("/cartPayFormId.do", new CartPayFormId());//결제창으로 어카운트뽑아오기+ db미결제지움
		map.put("/orderHistoryInsertSearch.do", new OrderHistoryInsertSearch());//결제진행
		map.put("/orderHistoryInsertSearch2.do", new OrderHistoryInsertSearch2());//결제완료 카트정보딜리트>>오더로옮기기
		map.put("/orderDelete.do", new OrderDelete());//결제취소..다시 결제하기구매버튼누를때이전 결제하려던내역지우기
		map.put("/orderComplete.do", new OrderComplete());//
		map.put("/orderHistory.do", new OrderHistory());//오더히스토리조회
		map.put("/orderDetail.do", new OrderDetail());//오더상세조회
	
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		String uri = request.getRequestURI(); // 요청한 uri를 구함
		String contextPath = request.getContextPath();// 루트를 구함,context path
		String page = uri.substring(contextPath.length());// 실제 수행할 요청을 구함.

		Command command = map.get(page); // init 메소드에서 수행할 명령을 가져온다.

//		Command command=new MainCommand();

		String viewPage = command.exec(request, response);// 명령을 수행하고 결과를 돌려받음.
		//전체상품리스트불러옴

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
