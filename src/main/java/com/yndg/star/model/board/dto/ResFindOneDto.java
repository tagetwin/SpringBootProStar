package com.yndg.star.model.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResFindOneDto {

	private int id;
	private String username;
	private String fileName;
	private String content;
	private int starCount;
	private String profile;
//	private String comment;
//	private String commentUsername;

}
