package co.bootjava.palette.art.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.bootjava.palette.art.service.ArtService;
import co.bootjava.palette.art.service.impl.ArtServiceImpl;
import co.bootjava.palette.common.Command;

public class ArtDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 내 피드 사진 삭제기능
		System.out.println("artDelete 도착!!");
		ArtService dao = new ArtServiceImpl();
	
		String number = request.getParameter("artNum");
		int num = Integer.parseInt(number);
				
		int art = dao.ArtDelete(num);
		
		String message = null;
		if(art>0) {
			message = "✔삭제가 완료되었습니다! 😊";
		}
		return "ajax:"+message;
	}
}
