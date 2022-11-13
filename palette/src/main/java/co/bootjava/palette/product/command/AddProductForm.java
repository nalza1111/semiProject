package co.bootjava.palette.product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.common.Command;

public class AddProductForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "product/addProductForm.tiles";
	}

}
