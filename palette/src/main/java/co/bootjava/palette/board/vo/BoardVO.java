package co.bootjava.palette.board.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int boardNumber; //글번호
	private String userId; //로그인아이디
	private String boardTitle; //글제목
	private String boardContent; //글내용
	private String boardWriter; //작성자이름
	private String createDate; //생성일자
	private int viewCnt; //조회수
}
