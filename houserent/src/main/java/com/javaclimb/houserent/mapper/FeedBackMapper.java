package com.javaclimb.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.FeedBack;
import org.apache.ibatis.annotations.Mapper;

/*用户反馈数据访问类*/

@Mapper
public interface FeedBackMapper extends BaseMapper<FeedBack> {

}