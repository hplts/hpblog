package com.hp.controller;


import cn.hutool.core.map.MapUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.json.JSONObject;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.hp.common.Result;
import com.hp.dto.LoginDto;
import com.hp.dto.RegisterDto;
import com.hp.entity.User;
import com.hp.service.UserService;
import com.hp.utils.JwtUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 胡平
 * @since 2021-02-01
 */

@RestController
public class UserController {
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private UserService userService;
    //文件上传的目录
    @Value("${file.uploadFolder}")
    String uploadFolder;
    /**
     * 默认账号密码：admin / 111111
     *
     */
    @CrossOrigin
    @PostMapping("/login")
    public Result login(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response) {
        User user = userService.getOne(new QueryWrapper<User>().eq("username", loginDto.getUsername()));
        //Assert.notNull(user, "用户不存在");
        if (user==null){
            return Result.fail("用户不存在!");
        }
        if(!user.getPassword().equals(SecureUtil.md5(loginDto.getPassword()))) {
            return Result.fail("密码错误！");
        }
        String jwt = jwtUtils.generateToken(user.getId());
        response.setHeader("Authorization", jwt);
        response.setHeader("Access-Control-Expose-Headers", "Authorization");
        // 用户可以另一个接口
        return Result.success(MapUtil.builder()
                .put("id", user.getId())
                .put("username", user.getUsername())
                .put("avatar", user.getAvatar())
                .put("email", user.getEmail())
                .map());
    }

    // 退出
    @GetMapping("/logout")
    @RequiresAuthentication
    public Result logout() {
        SecurityUtils.getSubject().logout();
        return Result.success("退出成功!");
    }

    // 新增用户(注册)  ---》用户头像上传
    @PostMapping("/reg")
    @CrossOrigin
    public Result register(@Validated @RequestParam(value="user") String u,@RequestParam(value="file") MultipartFile file) throws IOException {

        User user = JSON.parseObject(u, User.class);

        //密码加密
        String password = SecureUtil.md5(user.getPassword());
        user.setPassword(password);
        //图片的名字
        String ImgName = file.getOriginalFilename();
        //保存到数据库中图片的名字
        String name = user.getUsername()+"-"+ImgName;
        //将图片名保存到数据库中
        user.setAvatar(name);
        InputStream in = file.getInputStream();
        File mkdir = new File(uploadFolder);
        if (!mkdir.exists()) {
            mkdir.mkdirs();
        }
        //定义输出流，将文件写入硬盘
        String path = mkdir.getPath() +"\\"+ name;
        FileOutputStream os = new FileOutputStream(path);
        int len = 0;
        while ((len = in.read()) != -1) {
            os.write(len);
        }
        //关闭数据流
        os.flush();
        in.close();
        os.close();

        //将注册用户插入到数据库中
        boolean save = userService.save(user);
        if (!save) {
            return Result.fail("注册失败！");
        }
        return Result.success("注册成功");



    }

}

