package com.yndg.star.repository;

import com.yndg.star.model.user.dto.*;
import org.springframework.stereotype.Repository;

import com.yndg.star.model.user.MyUserDetails;

import java.util.List;

@Repository
public interface UserRepository {

	public int join(ReqJoinDto dto);
	public MyUserDetails authentication(String username);
	public int findIdByUsername(String username);
	public ResUserInfoDto findUserById(int id);
	public int update(ReqProfileDto dto);
	public ResProfileDto profile(int id);
	public ReqPasswordDto findPassword(int id);
	public int updatePassword(int id, String password1);
	public List<ResFindUserDto> findUser(int id);
}
