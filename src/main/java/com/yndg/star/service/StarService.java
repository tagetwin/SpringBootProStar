package com.yndg.star.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yndg.star.repository.StarRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class StarService {

	private StarRepository starRepository;
	
	// 스타 여부 검색
	@Transactional
	public int findStar(int userId, int boardId) {
		
		int result = starRepository.findStar(userId, boardId);
		return result;
		
	}
}
