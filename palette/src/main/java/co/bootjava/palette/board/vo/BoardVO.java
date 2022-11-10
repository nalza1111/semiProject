package co.bootjava.palette.board.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int boardNumber;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private String createDate;
	private int viewCnt;
}
