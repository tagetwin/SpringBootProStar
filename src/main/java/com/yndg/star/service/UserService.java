package com.yndg.star.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ResUserInfoDto;
import com.yndg.star.repository.UserRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class UserService{

	private UserRepository rep;
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public int join(ReqJoinDto dto) {
		String password =  encoder.encode(dto.getPassword());
		dto.setPassword(password);
		
		int result = rep.join(dto);
		return result;
	}

	@Transactional
	public int findIdByUsername(String username) {
		
		int result = rep.findIdByUsername(username);
		return result;
	}

	public ResUserInfoDto findUserById(int id) {
		ResUserInfoDto dto = rep.findUserById(id);
		return dto;
	}
	

}
