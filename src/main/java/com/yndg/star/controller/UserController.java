package com.yndg.star.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yndg.star.model.RespCM;
import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ReqLoginDto;
import com.yndg.star.service.UserService;
import com.yndg.star.util.Script;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class UserController {

	UserService service;
	
	// 가입하기 홈
	@GetMapping("/")
	public String join() {
	
		return "user/join";
	}
	
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
	
	// 로그인 수행
	@PostMapping("/login")
	public @ResponseBody String login(ReqLoginDto dto) {
		
		int result = service.login(dto);
		if(result == 1) {
			return Script.href("로그인 성공", "board/myList");
		}else {
			return Script.back("로그인 실패");
		}
	}
}
