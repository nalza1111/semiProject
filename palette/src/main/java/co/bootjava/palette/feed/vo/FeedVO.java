package co.bootjava.palette.feed.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FeedVO {
	private int feedNum;
	private String userId;
	private int userFollower;
	private String userName;
	private String userEmail;
	private String userSchool;
	private String userMajor;
	private String feedImage;
	private String feedContent;
	private String filesystemName;
	private String originalFileName;
}
