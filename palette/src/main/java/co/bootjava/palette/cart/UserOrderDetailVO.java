package co.bootjava.palette.cart;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
@AllArgsConstructor
public class UserOrderDetailVO {
	
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
