package com.yndg.star.model.comment;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
public class Comment {

	private int id;
	private String content;
	private int userId;
	private int boardId;
	private Date createDate;
	
	@Builder
	public Comment(String content, int userId, int boardId, Date createDate) {
		this.content = content;
		this.userId = userId;
		this.boardId = boardId;
		this.createDate = createDate;
	}
}
