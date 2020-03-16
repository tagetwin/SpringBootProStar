package com.yndg.star.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yndg.star.model.RespCM;
import com.yndg.star.model.board.dto.ResMyListDto;
import com.yndg.star.model.board.dto.ResWriteListDto;
import com.yndg.star.model.star.dto.StarCountDto;
import com.yndg.star.model.user.MyUserDetails;
import com.yndg.star.model.user.dto.ResUserInfoDto;
import com.yndg.star.service.BoardService;
import com.yndg.star.service.CommentService;
import com.yndg.star.service.FavoriteService;
import com.yndg.star.service.StarService;
import com.yndg.star.service.UserService;
import com.yndg.star.util.Script;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class BoardController {

	private BoardService boardservice;
	private UserService userService;
	private StarService starService;
	private CommentService commentService;
	private FavoriteService favoriteService;

	// 팔로우한 사람 게시물 불러오기
	@GetMapping("/board/list")
	public String myListBoard(Model model, @AuthenticationPrincipal MyUserDetails principal) {
		List<ResMyListDto> board = boardservice.myListBoard(principal.getId());
		model.addAttribute("board", board);
		return "board/list";
	}

	// 글쓰기 페이지로
	@GetMapping("/board/write")
	public String write() {

		return "board/write";
	}

	// 글쓰기 수행
	@PostMapping("/board/write")
	public String writeBoard(@RequestParam int userId, @RequestParam String content,
			@RequestParam MultipartFile fileName) {
		
		ResUserInfoDto dto = userService.findUserById(userId);
		String username = dto.getUsername();
		int result = boardservice.writeBoard(userId, content, fileName);
		if (result == 1) {
			return "redirect:/board/" + username;
		} else {
			return Script.back("글쓰기 실패");
		}

	}

	// 자신이 쓴 글 리스트로
	@GetMapping("/board/{username}")
	public String writeList(Model model, @PathVariable String username) {

		int id = (Integer)userService.findIdByUsername(username);
		model.addAttribute("board", boardservice.writeList(id));
		model.addAttribute("user", userService.findUserById(id));
		model.addAttribute("countList", boardservice.countList(id));
		return "board/writeList";
	}

	// 스타 더하기
	@PostMapping("/star")
	public ResponseEntity<?> plusStarCount(@RequestBody StarCountDto dto) {

		int result = boardservice.plusStarCount(dto.getBoardId());

		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	// 스타 빼기
	@DeleteMapping("/star")
	public ResponseEntity<?> minusStarCount(@RequestBody StarCountDto dto){
		
		int result = boardservice.minusStarCount(dto.getBoardId());
		
		if(result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	// 디테일 페이지로
	@GetMapping("/board/detail/{id}")
	public String detail(@PathVariable int id ,Model model, @AuthenticationPrincipal MyUserDetails principal) {

		int userId = principal.getId();
		model.addAttribute("board", boardservice.findOne(id));
		model.addAttribute("star", starService.findStar(userId, id));
		model.addAttribute("comment", commentService.resListComment(id));
		model.addAttribute("favorite", favoriteService.find(userId, id));
		return "board/detail";
	}

	// 내가쓴 페이지 글목록 불러오기
	@GetMapping("/writeList")
	public @ResponseBody List<ResWriteListDto> writeList(@AuthenticationPrincipal MyUserDetails principal){
		
		return boardservice.writeList(principal.getId());
	}

	// 탐색
	@GetMapping("/explore")
	public String explore(Model model, @AuthenticationPrincipal MyUserDetails principal){
		model.addAttribute("user", userService.findUser(principal.getId()));
		model.addAttribute("board", boardservice.findBoard(principal.getId()));
		return "board/explore";
	}

	// 검색
	@GetMapping("/board/search")
	public String search(Model model, @RequestParam String content, @AuthenticationPrincipal MyUserDetails principal){

		model.addAttribute("board",boardservice.searchBoard(principal.getId(), content));
		return "board/search";
	}
	
	// 삭제
	@DeleteMapping("/board/detail/{id}")
	public ResponseEntity<?> delete(@PathVariable int id) {
		
		if(boardservice.delete(id)==1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}
		return new ResponseEntity<RespCM>(new RespCM(500, "fail"), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
