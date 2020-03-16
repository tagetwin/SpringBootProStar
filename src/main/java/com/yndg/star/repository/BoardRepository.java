package com.yndg.star.repository;

import java.util.List;

import com.yndg.star.model.board.dto.ResFindBoardDto;
import com.yndg.star.model.board.dto.ResFindOneDto;
import org.springframework.stereotype.Repository;

import com.yndg.star.model.board.dto.ResMyListDto;
import com.yndg.star.model.board.dto.ResWriteListDto;

@Repository
public interface BoardRepository {

	public List<ResMyListDto> myListBoard(int id);
	public int writeBoard(int userId, String content, String fileName);
	public List<ResWriteListDto> writeList(int id);
	public int writeCount(int id);
	public int plusStarCount(int id);
	public int minusStarCount(int id);
	public ResFindOneDto findOne(int id);
	public List<ResFindBoardDto> findBoard(int id);
	public List<ResFindBoardDto> searchBoard(int id, String content);
	public int delete(int id);
}
