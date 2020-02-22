package com.yndg.star.model.favorite;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class Favorite {
    private int id;
    private int userId;
    private int boardId;
}
