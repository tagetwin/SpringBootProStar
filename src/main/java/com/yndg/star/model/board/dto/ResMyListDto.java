package com.yndg.star.model.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ResMyListDto {

	private int id;
	private String fileName;
	private String content;
	private int starCount;
	private Date createDate;
	private String username;
	
	
}
