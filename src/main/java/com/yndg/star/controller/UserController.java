package com.yndg.star.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
	HttpServletRequest req;
	
	// 가입 페이지 홈
	@GetMapping("")
	public String join(@CookieValue(value="usernameCookie", required = false) String cookie, Model model, Principal principal) {
		System.out.println(principal);
		System.out.println(cookie);
		if(principal !=null) {
			return "redirect:/board/myList";
		}else if(cookie != null) {
			model.addAttribute("username",cookie);
			return "user/login";
		}
		
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
