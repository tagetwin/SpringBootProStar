package com.yndg.star.repository;

import com.yndg.star.model.user.dto.*;
import org.springframework.stereotype.Repository;

import com.yndg.star.model.user.MyUserDetails;

@Repository
public interface UserRepository {

	public int join(ReqJoinDto dto);
	public MyUserDetails authentication(String username);
	public int findIdByUsername(String username);
	public ResUserInfoDto findUserById(int id);
	public int update(ReqProfileDto dto);
	public ResProfileDto profile(int id);
	public int findPassword(ReqPasswordDto dto);
	public int updatePassword(int id, String password1);
}
