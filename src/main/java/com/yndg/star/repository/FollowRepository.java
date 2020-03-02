package com.yndg.star.repository;

import org.springframework.stereotype.Repository;

import com.yndg.star.model.follow.dto.FollowDto;

@Repository
public interface FollowRepository {
	public int followCount(int id);
	public int followerCount(int id);
	public int follow(FollowDto dto);
	public int unfollow(FollowDto dto);
	public int selectFollow(int userId, int followId);
}
