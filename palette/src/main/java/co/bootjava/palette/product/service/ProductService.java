package co.bootjava.palette.product.service;

import java.util.List;

import co.bootjava.palette.product.ProductVO;

public interface ProductService {
	List<ProductVO> productSelectList();
	ProductVO productSelect(ProductVO vo);
	int productInsert(ProductVO vo);
	int productDelete(ProductVO vo);
	int productUpdate(ProductVO vo);
}
