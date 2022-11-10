package co.bootjava.palette.cart;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
@AllArgsConstructor
public class CartVO {
	private String cartNumber;
	private String productNumber;
	private String productCount;
	private String productPrice;
	private String account;
	@Override
	public String toString() {
		return "CartVO [cartNumber=" + cartNumber + ", productNumber=" + productNumber + ", productCount="
				+ productCount + ", productPrice=" + productPrice + ", account=" + account + "]";
	}
}
