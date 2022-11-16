package co.bootjava.palette.account.command;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.service.impl.AccountServiceImpl;
import co.bootjava.palette.common.Command;

public class EmailSend implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AccountService dao = new AccountServiceImpl();
		String email = request.getParameter("email");

		// 인증번호 생성
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int letter = 6;
		String resultNum = "";

		for (int i = 0; i < letter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resultNum += ranNum;
		}

		String subject = "Palette 회원가입 인증번호";
		String authMail = "인증번호는 " + resultNum + "입니다.";
		dao.sendMail(email, subject, authMail);
		String result = dao.sendMail(email, subject, authMail);

		if (result == "Fail") {
			return "failed";
		}
		return "ajax:" + resultNum;
	}

}
