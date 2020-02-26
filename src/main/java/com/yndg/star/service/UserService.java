package com.yndg.star.service;

import com.yndg.star.model.user.dto.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yndg.star.repository.UserRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class UserService{

	private UserRepository rep;
	private BCryptPasswordEncoder encoder;
	
	// 가입하기
	@Transactional
	public int join(ReqJoinDto dto) {
		String password =  encoder.encode(dto.getPassword());
		dto.setPassword(password);

		return rep.join(dto);
	}
	// 유저네임으로 아이디 찾기
	@Transactional
	public int findIdByUsername(String username) {

		return rep.findIdByUsername(username);
	}

	// 아이디로 유저찾기
	@Transactional
	public ResUserInfoDto findUserById(int id) {
		return rep.findUserById(id);
	}
	
	// 프로필 가져오기
	@Transactional
	public ResProfileDto findProfileById(int id) {
		return rep.profile(id);
	}
	
	// 프로필 업데이트
	@Transactional
	public int update(ReqProfileDto dto) {
		return rep.update(dto);
	}

	// 비밀번호 확인
	@Transactional
	public int findPassword(ReqPasswordDto dto){
		dto.setPassword(encoder.encode(dto.getPassword()));
		return rep.findPassword(dto);
	}

	// 비밀번호 변경
	@Transactional
	public int updatePassword(int id, String password1){

		return rep.updatePassword(id, encoder.encode(password1));
	}
}
