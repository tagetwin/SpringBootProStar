package com.yndg.star.repository;

import org.springframework.stereotype.Repository;

import com.yndg.star.model.comment.dto.ReqWriteCommentDto;
import com.yndg.star.model.comment.dto.ResCommentDto;

@Repository
public interface CommentRepository {

	public int writeComment(ReqWriteCommentDto dto);
	public ResCommentDto resComment(int id);
//	public List<ResCommetDto> resListComment(int )
}
