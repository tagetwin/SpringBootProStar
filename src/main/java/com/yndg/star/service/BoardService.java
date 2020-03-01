package com.yndg.star.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import com.yndg.star.model.board.dto.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.yndg.star.model.user.MyUserDetails;
import com.yndg.star.repository.BoardRepository;
import com.yndg.star.repository.CommentRepository;
import com.yndg.star.repository.FavoriteRepository;
import com.yndg.star.repository.FollowRepository;
import com.yndg.star.repository.StarRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	@Value("${file.path}")
	private String fileRealPath; // 서버에 배포하면 경로 변경해야함.

	private final BoardRepository rep;
	private final CommentRepository commentRepository;
	private final FollowRepository followRepository;
	private final StarRepository starRepository;
	private final FavoriteRepository favoriteRepository;
	
	// 팔로우한사람 글불러오기
	@Transactional
	public List<ResMyListDto> myListBoard(int id) {
		
		List<ResMyListDto> board = rep.myListBoard(id);

		for (ResMyListDto dto : board) {
//			System.out.println("boardId?:" + dto.getId());
			dto.setListComment(commentRepository.resListComment(dto.getId()));
			dto.setStar(starRepository.findStar(id, dto.getId()));
//			System.out.println("스타여부 : "+dto.getStar());
			dto.setFavorite(favoriteRepository.find(id, dto.getId()));
		}
		return board;
	}
	
	// 글쓰기 사진업로드
	@Transactional
	public int writeBoard(int userId, String content, MultipartFile fileName) {

		try {
			UUID uuid = UUID.randomUUID();
			String uuidFilename = uuid + fileName.getOriginalFilename();
			//nio
			Path filePath = Paths.get(fileRealPath+uuidFilename);
			System.out.println(filePath);
			
			int result = rep.writeBoard(userId, content, uuidFilename);
			
			Files.write(filePath, fileName.getBytes());
			if(result == 1) {
				return result;
			}else {
				return -1;
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	// 내가 쓴 글 리스트 불러오기
	@Transactional
	public List<ResWriteListDto> writeList(int id) {
		
		List<ResWriteListDto> board = rep.writeList(id);
		return board;
	}
	
	// 게시물수, 팔로워수, 팔로우수
	@Transactional
	public ResCountDto countList(int id) {
		
		try {
			ResCountDto dto = new ResCountDto();
			dto.setWriteCount(rep.writeCount(id));
			dto.setFollowCount(followRepository.followCount(id));
			dto.setFollowerCount(followRepository.followerCount(id));
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	// 스타 더하기
	@Transactional
	public int plusStarCount(int id) {
		
		MyUserDetails principal = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		int selectResult = starRepository.findStar(principal.getId(), id);
		if(selectResult != 1) {
			int plusResult = rep.plusStarCount(id);
			int insertRestult = starRepository.insertStar(principal.getId(), id);
			if(plusResult == 1 && insertRestult == 1) {
				return 1;
			}
		}else {
			return -1;
		}
		return -1;
	}
	
	// 스타 빼기
	@Transactional
	public int minusStarCount(int id) {

		MyUserDetails principal = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		int selectResult = starRepository.findStar(principal.getId(), id);
		if(selectResult == 1) {
			int minusResult = rep.minusStarCount(id);
			int deleteRestult = starRepository.deleteStar(principal.getId(), id);
			if(minusResult == 1 && deleteRestult == 1) {
				return 1;
			}
		}else {
			return -1;
		}
		return -1;
	}

	// 글 한개 불러오기 
	@Transactional
	public ResFindOneDto findOne(int id){
		return rep.findOne(id);
	}

	// 글 전체 불러오기
	@Transactional
	public List<ResFindBoardDto> findBoard(int id){

		return rep.findBoard(id);
	}

	// 글 검색 불러오기
	public List<ResFindBoardDto> searchBoard(int id, String content){
		return rep.searchBoard(id, content);
	}
}
