package co.bootjava.palette.product.mapper;

import java.util.List;

import co.bootjava.palette.product.vo.ProductVO;

public interface ProductMapper {
	List<ProductVO> productSelectList();
	ProductVO productSelect(ProductVO vo);
	int productInsert(ProductVO vo);
	int productDelete(ProductVO vo);
	int productUpdate(ProductVO vo);
	
	//조회수올리기
	int productUpdateHit(ProductVO vo);
	//정렬하기
	List<ProductVO> productSelectSortList(int n);
	//검색하기
	List<ProductVO> productSelectSearchList(ProductVO vo);
	
}
