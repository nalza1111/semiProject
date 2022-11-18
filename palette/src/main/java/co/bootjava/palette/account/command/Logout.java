package co.bootjava.palette.account.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.bootjava.palette.common.Command;

public class Logout implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String message = (String) session.getAttribute("name");
		message = message.concat("님 안녕히 가세요.");
		request.setAttribute("message", message);
		session.invalidate(); 
		return "main.do";
	}

}
