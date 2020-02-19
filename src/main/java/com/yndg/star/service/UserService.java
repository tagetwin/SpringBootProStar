package com.yndg.star.service;

import org.springframework.stereotype.Service;

import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ReqLoginDto;
import com.yndg.star.repository.UserRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class UserService implements UserRepository{

	UserRepository rep;
	
	
	@Override
	public int join(ReqJoinDto dto) {
		
		int result = rep.join(dto);
		return result;
	}


	@Override
	public int login(ReqLoginDto dto) {
		
		int result = rep.login(dto);
		
		return result;
	}

}
