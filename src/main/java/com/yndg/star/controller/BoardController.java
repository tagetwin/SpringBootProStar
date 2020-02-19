package com.yndg.star.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

	
	@GetMapping("/board/myList")
	public String myList(Model model) {
		
		
		
//		model.addAttribute("board", board);
		
		
		return "board/myList";
	}
}
