package com.yndg.star.repository;

import org.springframework.stereotype.Repository;

@Repository
public interface FollowRepository {
	public int followCount(int id);
	public int followerCount(int id);
}
