package co.bootjava.palette.product.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	@Override
	public String toString() {
		return "ProductVO [productNumber=" + productNumber + ", categoryCode=" + categoryCode + ", productName="
				+ productName + ", productPrice=" + productPrice + ", productDesc=" + productDesc + ", productStock="
				+ productStock + ", productHits=" + productHits + ", productDate=" + productDate + ", image=" + image
				+ "]";
	}
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
