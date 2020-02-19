package com.yndg.star.repository;

import com.yndg.star.model.user.User;
import com.yndg.star.model.user.dto.ReqJoinDto;
import com.yndg.star.model.user.dto.ReqLoginDto;

public interface UserRepository {

	int join(ReqJoinDto dto);
	int login(ReqLoginDto dto);
	User authentication(String username);
}
