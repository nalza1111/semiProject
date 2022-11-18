package co.bootjava.palette.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.art.service.ArtService;
import co.bootjava.palette.art.service.impl.ArtServiceImpl;
import co.bootjava.palette.art.vo.ArtVO;
import co.bootjava.palette.board.service.BoardService;
import co.bootjava.palette.board.service.impl.BoardServiceImpl;
import co.bootjava.palette.board.vo.BoardVO;
import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;
import co.bootjava.palette.product.vo.ProductVO;

public class MainCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ProductService proDao = new ProductServiceImpl();
		ArtService artDao = new ArtServiceImpl();
		List<ArtVO> art =new ArrayList<>();
		art = artDao.mainArtList(); // art 상위 목록
		request.setAttribute("art", art);
		
		AccountService accountDao = new AccountServiceImpl();
		List<AccountVO> account = new ArrayList<>();
		account = accountDao.mainAccountList(); //피드 전체목록
		request.setAttribute("account", account);
				
		List<ProductVO> list = new ArrayList<ProductVO>();
		list = proDao.productSelectSortList(7);
		System.out.println(list);
		List<ProductVO> topFivelist = new ArrayList<ProductVO>();
	      int max = 5;
	      if(list.size() < 5) max = list.size(); 
	      for(int i=0; i < max; i++) {
	         topFivelist.add(list.get(i));
	      }
	      request.setAttribute("topFivelist", topFivelist);
		
		BoardService boardDao=new BoardServiceImpl();
		List<BoardVO> board=new ArrayList<BoardVO>();
		board=boardDao.mainBoardList();
		request.setAttribute("board", board);
		
		return "main/main.tiles";
	}

}
