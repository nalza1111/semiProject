package co.bootjava.palette.account.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountVO {
	private String id;
	private String password;
	private String name;
	private String email;
	private String address;
	private String role;
	private String school;
	private String major;
	private String image;
	private int follower;
	private int ban;
	
}
