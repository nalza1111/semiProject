package co.bootjava.palette.order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;

public class OrderComplete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "order/orderComplete.tiles";
	}

}
