package com.yndg.star.model.user;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
public class Follow {
	
	private int id;
	private int userId;
	private int boardId;
	
	@Builder
	public Follow(int userId, int boardId) {
		this.userId = userId;
		this.boardId = boardId;
	}
}
