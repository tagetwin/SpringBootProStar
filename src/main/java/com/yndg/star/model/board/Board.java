package com.yndg.star.model.board;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
public class Board {

	private int id;
	private String content;
	private int starCount;
	private String fileName;
	private Date createDate;
	private int userId;
	
	@Builder
	public Board(String content, int starCount, String fileName, Date createDate, int userId) {
		this.content = content;
		this.starCount = starCount;
		this.fileName = fileName;
		this.createDate = createDate;
		this.userId = userId;
	}
}
