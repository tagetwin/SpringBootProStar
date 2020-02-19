package com.yndg.star.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yndg.star.model.user.User;
import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ReqLoginDto;
import com.yndg.star.repository.UserRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class UserService implements UserRepository{

	UserRepository rep;
	BCryptPasswordEncoder encoder;
	
	@Override
	public int join(ReqJoinDto dto) {
		String password =  encoder.encode(dto.getPassword());
		dto.setPassword(password);
		
		int result = rep.join(dto);
		return result;
	}


	@Override
	public int login(ReqLoginDto dto) {
		
		int result = rep.login(dto);
		
		return result;
	}


	@Override
	public User authentication(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
