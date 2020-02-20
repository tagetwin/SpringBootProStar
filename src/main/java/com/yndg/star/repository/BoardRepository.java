package com.yndg.star.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yndg.star.model.board.dto.ResMyListDto;
import com.yndg.star.model.board.dto.ResWriteListDto;

@Repository
public interface BoardRepository {

	public List<ResMyListDto> myListBoard(int id);
	public int write(int id, String content, String fileName);
	public List<ResWriteListDto> writeList(int id);
	public int writeCount(int id);
	public int followCount(int id);
	public int followerCount(int id);
}
