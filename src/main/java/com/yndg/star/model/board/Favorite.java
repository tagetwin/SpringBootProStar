package com.yndg.star.model.board;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
public class Favorite {
	
	private int id;
	private int userId;
	private int boardId;

	@Builder
	public Favorite(int userId, int boardId) {
		this.userId = userId;
		this.boardId = boardId;
	}
}
