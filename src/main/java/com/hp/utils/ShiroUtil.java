package com.hp.utils;

/**
 * @Auther: Administrator
 * @Date: 2021-02-02
 * @Description:
 */
import com.hp.config.shiro.AccountProfile;
import org.apache.shiro.SecurityUtils;

public class ShiroUtil {

    public static AccountProfile getProfile() {
        return (AccountProfile) SecurityUtils.getSubject().getPrincipal();
    }

}