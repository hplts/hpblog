package com.hp.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @Auther: Administrator
 * @Date: 2021-02-02
 * @Description: 登入实体类
 */
@Data
public class LoginDto {
    private String username;
    private String password;
}
