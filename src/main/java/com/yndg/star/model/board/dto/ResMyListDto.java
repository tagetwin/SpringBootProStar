package com.yndg.star.model.board.dto;

import java.util.Date;
import java.util.List;

import com.yndg.star.model.comment.dto.ResListCommentDto;

import lombok.Data;

@Data
public class ResMyListDto {

	private int id;
	private String fileName;
	private String content;
	private int starCount;
	private Date createDate;
	private String username;
	private String profile;
	private List<ResListCommentDto> listComment;
	private int star;
	private int favorite;
	
}
