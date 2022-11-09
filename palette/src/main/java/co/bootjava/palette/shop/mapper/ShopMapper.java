package co.bootjava.palette.shop.mapper;

import java.util.List;

import co.bootjava.palette.product.ProductVO;

public interface ShopMapper {
	List<ProductVO> productSelectList();
	ProductVO productSelect(ProductVO vo);
	int productInsert(ProductVO vo);
	int productDelete(ProductVO vo);
	int productUpdate(ProductVO vo);
}
