package com.yndg.star.model.board;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
public class Star {

	private int id;
	private int userId;
	private int boardId;
	
	@Builder
	public Star(int userId, int boardId) {
		this.userId = userId;
		this.boardId = boardId;
	}
}
