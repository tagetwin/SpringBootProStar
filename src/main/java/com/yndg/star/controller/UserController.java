package com.yndg.star.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.yndg.star.model.RespCM;
import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.service.UserService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class UserController {

	UserService service;
	
	// 가입 페이지 홈
	@GetMapping("")
	public String join() {
	
		return "user/join";
	}
	
	// 가입하기
	@PostMapping("/join")
	public ResponseEntity<?> join(@RequestBody ReqJoinDto dto){
		
		int result = service.join(dto);
		if(result==1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
		 
	}
	
	// 로그인 페이지로
	@GetMapping("/login")
	public String login() {
	
		return "user/login";
	}
	
}
