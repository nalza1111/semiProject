package co.bootjava.palette.shop.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.ProductVO;
import co.bootjava.palette.shop.service.ShopService;
import co.bootjava.palette.shop.service.impl.ShopServiceImpl;

public class AddProduct implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//상품추가 서블릿
		String saveDir = request.getServletContext().getRealPath("upload");
		System.out.println(saveDir);
		String encoding = "UTF-8";
		int maxSize = 500 * 1024 * 1024; //500mb로 이미지 크기 제한
		MultipartRequest multipartrequest = null;
		try {
			multipartrequest = new MultipartRequest(
				request,
				saveDir,
				maxSize,
				encoding,
				new DefaultFileRenamePolicy()
			);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("상품업로드 중 에러 발생");
		}
		
		String categoryCode = multipartrequest.getParameter("categoryCode");
		String productName = multipartrequest.getParameter("productName");
		String productPrice = multipartrequest.getParameter("productPrice");
		String productDesc = multipartrequest.getParameter("productDesc");
		String image = multipartrequest.getFilesystemName("image");
		//DB입력
		ProductVO product = new ProductVO("",//productNumber,
											categoryCode,
											productName,
											productPrice,
											productDesc,
											"",//productStock
											"",//productHits
											"",//productDate
											image);
		ShopService dao = new ShopServiceImpl();
		int productTest = dao.productInsert(product);
		System.out.println("AddProductTest"+productTest);
		return "shop/shopmain";
	}

}
