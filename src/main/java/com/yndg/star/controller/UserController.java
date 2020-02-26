package com.yndg.star.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import com.yndg.star.model.user.dto.ReqPasswordDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.yndg.star.model.RespCM;
import com.yndg.star.model.user.MyUserDetails;
import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ReqProfileDto;
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
	
	// 프로필 페이지로
	@GetMapping("/user/profile")
	public String profile(Model model, @AuthenticationPrincipal MyUserDetails principal) {
		model.addAttribute("profile", service.findProfileById(principal.getId()));
		return "user/profile";
	}
	
	// 프로필 업데이트
	@PutMapping("/profile")
	public ResponseEntity<?> update(@RequestBody ReqProfileDto dto, @AuthenticationPrincipal MyUserDetails principal){
		dto.setId(principal.getId());
		int result = service.update(dto);

		if(result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_GATEWAY);
		}
	}

	// 비밀번호 변경 페이지로
	@GetMapping("/user/password")
	public String updatePassword(){
		return "user/password";
	}

	// 비밀번호 확인 및 변경
	@PutMapping("/user/updatePassword")
	public ResponseEntity<?> updatePassword(@RequestBody ReqPasswordDto dto, @AuthenticationPrincipal MyUserDetails principal){
		dto.setId(principal.getId());
		int result = service.findPassword(dto);
		if(result == 1){
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}else{
			int result2 = service.updatePassword(dto.getId(), dto.getPassword1());
			if(result2 == 1){
				return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
			}else{
				return new ResponseEntity<RespCM>(new RespCM(500, "fail"), HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
	}
}
