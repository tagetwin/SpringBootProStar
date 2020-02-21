package com.yndg.star.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.yndg.star.model.board.dto.ResCountDto;
import com.yndg.star.model.board.dto.ResMyListDto;
import com.yndg.star.model.board.dto.ResWriteListDto;
import com.yndg.star.repository.BoardRepository;
import com.yndg.star.repository.CommentRepository;

@Service
public class BoardService {

	@Value("${file.path}")
	private String fileRealPath; // 서버에 배포하면 경로 변경해야함.
	
	@Autowired
	private BoardRepository rep;
	
	@Autowired
	private CommentRepository commentRepository;
	
	// 팔로우한사람 글불러오기
	@Transactional
	public List<ResMyListDto> myListBoard(int id) {
		
		List<ResMyListDto> board = rep.myListBoard(id);
		
		for(int i=0; i<board.size(); i++) {
			ResMyListDto dto = board.get(i);
			System.out.println("boardId?:"+dto.getId());
			dto.setListComment(commentRepository.resListComment(dto.getId()));
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
			// TODO Auto-generated catch block
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
			dto.setFollowCount(rep.followCount(id));
			dto.setFollowerCount(rep.followerCount(id));
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}
