package co.bootjava.palette.exhibit.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExhibitVO {
	private int exhibitNum;
	private String exhibitName;
	private String startDate;
	private String endDate;
	private String exhibitSchool;
	private String exhibitMajor;
	private String image;
	private String content;
	
	private String filesystemName;
	private String originalFileName;
}
