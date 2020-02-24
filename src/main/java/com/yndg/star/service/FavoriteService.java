package com.yndg.star.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yndg.star.model.favorite.dto.ResFavoriteDto;
import com.yndg.star.repository.FavoriteRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class FavoriteService {
	
	private FavoriteRepository rep;
	
	// 북마크 추가 
	@Transactional
	public int insert(int userId, int boardId){
		
		int result = rep.find(userId, boardId);
		if(result == 0) {
			return rep.insert(userId, boardId);
		}else {
			return -1;
		}
	}
	
	// 북마크 제거
	@Transactional
	public int delete(int userId, int boardId){
		
		int result = rep.find(userId, boardId);
		if(result == 1) {
			return rep.delete(userId, boardId);
		}else {
			return -1;
		}
	}
	
	// 북마크 여부 찾기
	@Transactional
	public int find(int userId, int boardId){
		
		int result = rep.find(userId, boardId);
		return result;
	}
	
	// 추가한 북마크 가져오기
	@Transactional
	public List<ResFavoriteDto> findFavoriteById(int id){
		
		return rep.findFavoriteById(id);
		
	}
	
}
