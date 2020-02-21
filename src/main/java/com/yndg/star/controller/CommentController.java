package com.yndg.star.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.yndg.star.model.RespCM;
import com.yndg.star.model.comment.dto.ReqWriteCommentDto;
import com.yndg.star.model.comment.dto.ResCommentDto;
import com.yndg.star.service.CommentService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class CommentController {

//	private BoardService boardservice;
//	private UserService userService;
	private CommentService commentService; 
	
	// 글쓰기 수행
	@PostMapping("/comment")
	public ResponseEntity<?> writeComment(@RequestBody ReqWriteCommentDto dto) {
		
		ResCommentDto comment = commentService.writeComment(dto);
		
		if(comment != null) {
			comment.setStatus(new RespCM(200, "ok"));
			return new ResponseEntity<ResCommentDto>(comment, HttpStatus.OK);
		}else {
			ResCommentDto temp = new ResCommentDto();
			temp.setStatus(new RespCM(400, "fail"));
			return new ResponseEntity<ResCommentDto>(temp, HttpStatus.BAD_REQUEST);
		}
		
		
	}
}
