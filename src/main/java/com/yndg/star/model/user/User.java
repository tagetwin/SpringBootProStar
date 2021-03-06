package com.yndg.star.model.user;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
@Setter
public class User{

	private int id;
	private String username;
	private String password;
	private String email;
	private String  phoneNum;
	private String profile;
	private Date createDate;
	private String role;
	private String info;
	
	@Builder
	public User(String username, String password, String email, String phoneNum, String profile, String role, String info) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.phoneNum = phoneNum;
		this.profile = profile;
		this.role = role;
		this.info = info;
	}


}
