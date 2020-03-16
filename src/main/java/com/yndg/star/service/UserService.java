package com.yndg.star.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ReqPasswordDto;
import com.yndg.star.model.user.dto.ReqProfileDto;
import com.yndg.star.model.user.dto.ResFindUserDto;
import com.yndg.star.model.user.dto.ResProfileDto;
import com.yndg.star.model.user.dto.ResUserInfoDto;
import com.yndg.star.repository.FollowRepository;
import com.yndg.star.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService{

	@Value("${file.path}")
	private String fileRealPath; // 서버에 배포하면 경로 변경해야함.

	private final UserRepository rep;
	private final BCryptPasswordEncoder encoder;
	private final FollowRepository followRepository;

	// 가입하기
	@Transactional
	public int join(ReqJoinDto dto) {
		if(rep.duplicate(dto.getUsername()) == 1) {
			return -1;
		}else {
			dto.setPassword(encoder.encode(dto.getPassword()));
			return rep.join(dto);
		}
		
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
	public boolean findPassword(ReqPasswordDto dto){
//		dto.setPassword(encoder.encode(dto.getPassword()));
		String rawPassword = dto.getPassword();
		ReqPasswordDto dto1 = rep.findPassword(dto.getId());
		String encodedPassword = dto1.getPassword();

		return encoder.matches(rawPassword, encodedPassword);

	}

	// 비밀번호 변경
	@Transactional
	public int updatePassword(int id, String password1){

		return rep.updatePassword(id, encoder.encode(password1));
	}

	// 유저 가져오기
	@Transactional
	public List<ResFindUserDto> findUser(int id){
		List<ResFindUserDto> list = rep.findUser(id);
		for(ResFindUserDto dto : list){
			dto.setFollow(followRepository.selectFollow(id, dto.getId()));
		}
		return list;
	}

	// 유저 프로필 업로드
	@Transactional
	public String upload(MultipartFile file, int id){
		try {
			UUID uuid = UUID.randomUUID();
			String uuidFilename = uuid + file.getOriginalFilename();
			Path filePath = Paths.get(fileRealPath+uuidFilename);
			System.out.println(filePath);
			Files.write(filePath, file.getBytes());
			int result = rep.upload(uuidFilename, id);
			if(result==1){
				return uuidFilename;
			}else{
				return null;
			}

		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}
