package com.yndg.star.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yndg.star.model.RespCM;
import com.yndg.star.model.user.MyUserDetails;
import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ReqPasswordDto;
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
//		System.out.println(principal);
//		System.out.println(cookie);
		if(principal !=null) {
			return "redirect:/explore";
		}else if(cookie != null) {
			model.addAttribute("username",cookie);
			return "user/login";
		}
		
		return "user/join";
	}
	
	// 가입하기
	@PostMapping("/join")
	public ResponseEntity<?> join(@Valid @RequestBody ReqJoinDto dto,BindingResult bindingResult){
		
//		int result = ;
		if(service.join(dto)==1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}else if(service.join(dto)==-1){
			return new ResponseEntity<RespCM>(new RespCM(400, "아이디중복"), HttpStatus.OK);
		}else {
			return new ResponseEntity<RespCM>(new RespCM(500, "fail2"), HttpStatus.INTERNAL_SERVER_ERROR);
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
		boolean result = service.findPassword(dto);
		if(!result){
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

	// 프로필 이미지 바꾸기
	@PostMapping("/upload")
	public @ResponseBody String upload(@RequestParam MultipartFile file, @AuthenticationPrincipal MyUserDetails principal){
		return service.upload(file, principal.getId());
	}

	// 프로필 이미지 삭제
	@PutMapping("/delete_profile")
	public ResponseEntity<?> delete_profile(@AuthenticationPrincipal MyUserDetails principal){
		
		if(service.delete_profile(principal.getId())==1){
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}
		return new ResponseEntity<RespCM>(new RespCM(500, "fail"), HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
