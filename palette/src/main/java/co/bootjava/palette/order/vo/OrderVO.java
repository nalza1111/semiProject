
package co.bootjava.palette.order.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderVO { //주문완료시 오더넘버 받아와서 여기에 주문한 목록 생성함
	private String orderNumber;
	private String productNumber;
	private String productCount;
	private String productPrice;
	private String id;
	private String payDo;
}
