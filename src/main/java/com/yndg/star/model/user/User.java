package com.yndg.star.model.user;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
public class User {

	private int id;
	private String username;
	private String password;
	private String email;
	private int phoneNum;
	private String profile;
	private Date createDate;
	private String role;
	
	@Builder
	public User(String username, String password, String email, int phoneNum, String profile, String role) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.phoneNum = phoneNum;
		this.profile = profile;
		this.role = role;
	}
}
