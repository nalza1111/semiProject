package co.bootjava.palette.cart.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
@AllArgsConstructor
public class UserOrderDetailVO { //테이블사용안함(조인이용카트)
	
	private String productNumber;
	private String productName;
	private String productCount;
	private String productPrice;
	private String image;
	private String id;
	
	@Override
	public String toString() {
		return "UserOrderDetailVO [productNumber=" + productNumber + ", productName=" + productName + ", productCount="
				+ productCount + ", productPrice=" + productPrice + ", image=" + image + ", id=" + id + "]";
	}
}
