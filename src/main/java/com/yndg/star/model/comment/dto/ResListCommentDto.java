package com.yndg.star.model.comment.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ResListCommentDto {
	
	private int id;
	private String content;
	private int userId;
	private int boardId;
	private Date createDate;
	private String username;
	
}
