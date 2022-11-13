package co.bootjava.palette.cart.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {
	private String cartNumber;
	private String productNumber;
	private String productCount;
	private String productPrice;
	private String id;
	@Override
	public String toString() {
		return "CartVO [cartNumber=" + cartNumber + ", productNumber=" + productNumber + ", productCount="
				+ productCount + ", productPrice=" + productPrice + ", account=" + id + "]";
	}
}
