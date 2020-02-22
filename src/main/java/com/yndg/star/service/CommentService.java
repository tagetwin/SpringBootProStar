package com.yndg.star.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yndg.star.model.comment.dto.ReqWriteCommentDto;
import com.yndg.star.model.comment.dto.ResCommentDto;
import com.yndg.star.repository.CommentRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class CommentService {

	private CommentRepository rep;
	
	// 댓글쓰기
	@Transactional
	public ResCommentDto writeComment(ReqWriteCommentDto dto) {
		
		int result = rep.writeComment(dto);
		
		if(result == 1) {
			return rep.resComment(dto.getId());
		}
		return null;
	}
}
