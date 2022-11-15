package co.bootjava.palette.art.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArtVO {
	private int artNum;
	private String artId;
	private String artTitle;
	private String artContent;
	private String artImage;
	private String artCreationDate;
	private int artViewCnt;
	private int artBanCnt;
}
