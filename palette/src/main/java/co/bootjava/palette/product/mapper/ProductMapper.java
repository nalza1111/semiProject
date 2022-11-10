package co.bootjava.palette.product.mapper;

import java.util.List;

import co.bootjava.palette.product.ProductVO;

public interface ProductMapper {
	List<ProductVO> productSelectList();
	ProductVO productSelect(ProductVO vo);
	int productInsert(ProductVO vo);
	int productDelete(ProductVO vo);
	int productUpdate(ProductVO vo);
}
