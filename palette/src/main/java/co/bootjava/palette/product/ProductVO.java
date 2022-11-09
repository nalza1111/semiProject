package co.bootjava.palette.product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ProductVO {
	 private String productNumber;
	 private String categoryCode;
	 private String productName;
	 private String productPrice;
	 private String productDesc;
	 private String productStock;
	 private String productHits;
	 private String productDate;
	 private String image;
}
