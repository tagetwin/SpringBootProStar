package com.yndg.star.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yndg.star.model.follow.dto.FollowDto;
import com.yndg.star.repository.FollowRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class FollowService {

	private final FollowRepository repository;

	@Transactional
	public int follow(FollowDto dto){
		int result = repository.selectFollow(dto.getUserId(), dto.getFollowId());
		if(result == 0){
			return repository.follow(dto);
		}
		return -1;
	}

	@Transactional
	public int unfollow(FollowDto dto){
		int result = repository.selectFollow(dto.getUserId(), dto.getFollowId());
		if(result == 1){
			return repository.unfollow(dto);
		}
		return -1;
	}

}
