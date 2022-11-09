package co.bootjava.palette.cart;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class CartVO {
	private String cartNumber;
	private String productNumber;
	private int productCount;
	private int productPrice;
}
