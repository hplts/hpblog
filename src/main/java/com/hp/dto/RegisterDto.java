package com.hp.dto;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

/**
 * @Auther: Administrator
 * @Date: 2021-02-06
 * @Description:
 */
@Data
public class RegisterDto {
    @NotBlank(message = "用户名不能为空")
    private String username;
    private String avatar;
    @Email(message = "邮箱格式不正确")
    private String email;
    @NotBlank(message = "密码不能为空")
    private String password;
}
