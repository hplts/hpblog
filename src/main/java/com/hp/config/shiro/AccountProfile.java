package com.hp.config.shiro;

/**
 * @Auther: Administrator
 * @Date: 2021-02-01
 * @Description:
 */
import lombok.Data;

import java.io.Serializable;

@Data
public class AccountProfile implements Serializable {

    private Long id;

    private String username;

    private String avatar;

    private String email;

}