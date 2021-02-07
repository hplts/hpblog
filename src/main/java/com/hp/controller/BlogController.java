package com.hp.controller;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hp.common.Result;
import com.hp.entity.Blog;
import com.hp.mapper.BlogMapper;
import com.hp.service.BlogService;
import com.hp.utils.ShiroUtil;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 胡平
 * @since 2021-02-01
 */
@RestController
public class BlogController {
    @Autowired
    private BlogService blogService;
    @GetMapping("/blogs")
    public Result blogs(@RequestParam(name = "currentPage") Integer currentPage) {
        if(currentPage == null || currentPage < 1)
            currentPage = 1;
        Page<Blog> page = new Page<>(currentPage, 3);
        IPage<Blog> pageData = blogService.page(page, new QueryWrapper<Blog>().orderByAsc("update_time"));
        return Result.success(pageData);
    }
    @GetMapping("/blog/{id}")
    public Result detail(@PathVariable(name = "id") Long id) {
        Blog blog = blogService.getById(id);
        Assert.notNull(blog, "该博客已删除！");
        return Result.success(blog);
    }

    @RequiresAuthentication
    @PostMapping("/blog/edit")
    public Result edit(@Validated @RequestBody Blog blog) {
        //System.out.println(blog.toString());
        Blog temp = null;
        if(blog.getId() != null) {
            temp = blogService.getById(blog.getId());
            Assert.isTrue(temp.getUserId().equals(ShiroUtil.getProfile().getId()), "没有权限编辑");
        } else {
            temp = new Blog();
            temp.setUserId(ShiroUtil.getProfile().getId());
            //temp.setCreateTime(new DateTime());
            temp.setStatus(0);
        }
        BeanUtil.copyProperties(blog, temp, "id", "userId",  "status");
        blogService.saveOrUpdate(temp);
        return Result.success("操作成功");
    }

    @GetMapping("/delBlog/{blogId}")
    public Result delete(@PathVariable(name = "blogId") Long blogId){
        boolean b = blogService.removeById(blogId);
        if (!b){
            return Result.fail("删除失败!");
        }
        return Result.success("删除成功!");
    }
}

