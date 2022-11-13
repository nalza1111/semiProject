package co.bootjava.palette.order.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class OrderHistoryVO {
	private String orderNumber;
	private String id;
	private String orderDate;
	private String address;
	private String Name;
	private String tel;
	private String payDo; //결제여부..디폴트는1(결제x)
}
