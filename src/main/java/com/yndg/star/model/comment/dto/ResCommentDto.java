package com.yndg.star.model.comment.dto;

import java.util.Date;

import com.yndg.star.model.RespCM;

import lombok.Data;

@Data
public class ResCommentDto {
	
	RespCM status;

	private int id;
	private String content;
	private int userId;
	private int boardId;
	private Date createDate;
	private String username;
	
}
