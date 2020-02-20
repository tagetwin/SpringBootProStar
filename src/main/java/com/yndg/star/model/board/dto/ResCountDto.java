package com.yndg.star.model.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResCountDto {

	private int writeCount;
	private int followCount;
	private int followerCount;
}
