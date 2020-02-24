package com.yndg.star.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.yndg.star.model.RespCM;
import com.yndg.star.model.favorite.dto.ResFavoriteDto;
import com.yndg.star.model.user.MyUserDetails;
import com.yndg.star.service.FavoriteService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class FavoriteController {

	private FavoriteService service;
	
	// 북마크 더하기
	@PostMapping("/favorite/{boardId}")
	public ResponseEntity<?> insert(@PathVariable int boardId, @AuthenticationPrincipal MyUserDetails principal) {

		int userId = principal.getId();
		int result = service.insert(userId, boardId);

		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
	
	// 북마크 빼기
	@DeleteMapping("/favorite/{boardId}")
	public ResponseEntity<?> delete(@PathVariable int boardId, @AuthenticationPrincipal MyUserDetails principal) {

		int userId = principal.getId();
		int result = service.delete(userId, boardId);

		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/favorite")
	public List<ResFavoriteDto> find(@AuthenticationPrincipal MyUserDetails principal){
		
		return service.findFavoriteById(principal.getId());
	}
}
