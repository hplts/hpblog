package com.hp.mapper;

import com.hp.entity.Blog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 胡平
 * @since 2021-02-01
 */
@Mapper
public interface BlogMapper extends BaseMapper<Blog> {

}
