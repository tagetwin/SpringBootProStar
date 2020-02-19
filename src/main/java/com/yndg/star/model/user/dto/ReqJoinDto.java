package com.yndg.star.model.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqJoinDto {
	
	private String username;
	private String password;
	private String email;
}
