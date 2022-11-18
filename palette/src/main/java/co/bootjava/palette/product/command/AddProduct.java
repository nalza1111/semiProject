package co.bootjava.palette.product.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.bootjava.palette.common.Command;
import co.bootjava.palette.product.service.ProductService;
import co.bootjava.palette.product.service.impl.ProductServiceImpl;
import co.bootjava.palette.product.vo.ProductVO;

public class AddProduct implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//상품추가 서블릿
//		String saveDir = request.getServletContext().getRealPath("upload");
//		String saveDir ="C:/Users/82104/git/semiProject/palette/src/main/webapp/image";
//		String saveDir ="D:/Dev/semiGit/palette/src/main/webapp/image";
		String saveDir = request.getServletContext().getRealPath("image")+"\\product";
		System.out.println(saveDir);
		String pImage = null;
		String oImage = null;
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
			
			pImage = multipartrequest.getFilesystemName("image");
			oImage = "\\palette\\image\\product\\" + multipartrequest.getOriginalFileName("image");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("상품업로드 중 에러 발생");
		}
		
		String categoryCode = multipartrequest.getParameter("categoryCode");
		String productName = multipartrequest.getParameter("productName");
		String productPrice = multipartrequest.getParameter("productPrice");
		String productDesc = multipartrequest.getParameter("productDesc");
		
		
		//DB입력
		ProductVO product = new ProductVO("",//productNumber,
											categoryCode,
											productName,
											productPrice,
											productDesc,
											"",//productStock
											"",//productHits
											"",//productDate
											oImage);
		ProductService dao = new ProductServiceImpl();
		int productTest = dao.productInsert(product);
		System.out.println(pImage + " :  " + productTest);
		return "product/indexProduct.tiles";
	}

}
