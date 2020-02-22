package com.yndg.star.model.follow;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
public class Follow {
    private int id;
    private int userId;
    private int followId;
}
