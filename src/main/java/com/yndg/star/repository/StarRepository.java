package com.yndg.star.repository;

import org.springframework.stereotype.Repository;

@Repository
public interface StarRepository {
	public int selectStar(int userId, int boardId);
	public int insertStar(int userId, int boardId);
	public int deleteStar(int userId, int boardId);
}
