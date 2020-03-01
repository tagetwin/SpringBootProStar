package com.yndg.star.service;

import com.yndg.star.model.board.dto.*;
import com.yndg.star.model.follow.Follow;
import com.yndg.star.model.follow.dto.FollowDto;
import com.yndg.star.model.user.MyUserDetails;
import com.yndg.star.repository.*;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Service
@AllArgsConstructor
public class FollowService {

	private final FollowRepository repository;

	@Transactional
	public int follow(FollowDto dto){
		return repository.follow(dto);
	}

	@Transactional
	public int unfollow(FollowDto dto){
		return repository.unfollow(dto);
	}
}
