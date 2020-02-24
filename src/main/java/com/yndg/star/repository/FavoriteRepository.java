package com.yndg.star.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yndg.star.model.favorite.dto.ResFavoriteDto;

@Repository
public interface FavoriteRepository {
	public int insert(int userId, int boardId);
	public int delete(int userId, int boardId);
	public int find(int userId, int boardId);
	public List<ResFavoriteDto> findFavoriteById(int id);
	
}
