package com.yndg.star.repository;

import org.springframework.stereotype.Repository;

import com.yndg.star.model.user.MyUserDetails;
import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ResUserInfoDto;

@Repository
public interface UserRepository {

	public int join(ReqJoinDto dto);
	public MyUserDetails authentication(String username);
	public int findIdByUsername(String username);
	public ResUserInfoDto findUserById(int id);
}
