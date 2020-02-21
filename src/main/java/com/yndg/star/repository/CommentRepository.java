package com.yndg.star.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yndg.star.model.comment.dto.ReqWriteCommentDto;
import com.yndg.star.model.comment.dto.ResCommentDto;
import com.yndg.star.model.comment.dto.ResListCommentDto;

@Repository
public interface CommentRepository {

	public int writeComment(ReqWriteCommentDto dto);
	public ResCommentDto resComment(int id);
	public List<ResListCommentDto> resListComment(int id);
}
