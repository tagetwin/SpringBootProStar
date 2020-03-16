package com.yndg.star.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.yndg.star.model.RespCM;
import com.yndg.star.model.follow.dto.FollowDto;
import com.yndg.star.service.FollowService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class FollowController {

	private final FollowService service;

	@PostMapping("/follow")
	public ResponseEntity<?> follow(@RequestBody FollowDto dto){
		int result = service.follow(dto);
		if(result==1){
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}else{
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	@DeleteMapping("/unfollow")
	public ResponseEntity<?> unfollow(@RequestBody FollowDto dto){
		int result = service.unfollow(dto);
		if(result==1){
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}else{
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
}
