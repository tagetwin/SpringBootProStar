package com.yndg.star.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yndg.star.model.user.MyUserDetails;
import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ReqPasswordDto;
import com.yndg.star.model.user.dto.ReqProfileDto;
import com.yndg.star.model.user.dto.ResFindUserDto;
import com.yndg.star.model.user.dto.ResProfileDto;
import com.yndg.star.model.user.dto.ResUserInfoDto;

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
	public int upload(String profile, int id);
	public String selectProfile(int id);
	public int duplicate(String username);
}
