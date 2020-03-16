package com.yndg.star.model.user.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqJoinDto {
	
	@NotBlank(message = "username을 입력해주세요")
	private String username;
	@NotBlank(message = "password를 입력해주세요")
	private String password;
	@NotBlank(message = "email을 입력해주세요")
	@Email(message = "email형식이 아닙니다.")
	private String email;
}
