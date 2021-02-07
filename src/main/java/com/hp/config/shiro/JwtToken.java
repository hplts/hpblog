package com.hp.config.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @Auther: Administrator
 * @Date: 2021-02-01
 * @Description:
 */


public class JwtToken implements AuthenticationToken {

    private String token;

    public JwtToken(String jwt) {
        this.token = jwt;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
