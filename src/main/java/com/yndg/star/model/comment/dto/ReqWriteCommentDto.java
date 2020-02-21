package com.yndg.star.model.comment.dto;

import lombok.Data;

@Data
public class ReqWriteCommentDto {

	private int id;
	private String content;
	private int userId;
	private int boardId;
	
}
