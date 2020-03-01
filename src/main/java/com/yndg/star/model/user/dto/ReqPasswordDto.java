package com.yndg.star.model.user.dto;

import lombok.Data;

@Data
public class ReqPasswordDto {
    private int id;
    private String password;
    private String password1;
    private String password2;
}
