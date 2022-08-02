package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.FeedBack;
import com.javaclimb.houserent.mapper.FeedBackMapper;
import com.javaclimb.houserent.service.FeedBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

//用户反馈实现类

@Service
public class FeedBackServiceImpl implements FeedBackService {
    @Autowired
    private FeedBackMapper feedBackMapper;

    @Override
    public BaseMapper<FeedBack> getRepositorty() {
        return feedBackMapper;
    }

    @Override
    public QueryWrapper<FeedBack> getQueryWrapper(FeedBack feedBack) {
        QueryWrapper<FeedBack> queryWrapper = new QueryWrapper<>();
        if (feedBack!=null&&feedBack.getUserId()!=null) {
            queryWrapper.eq("user_id",feedBack.getUserId());
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<FeedBack> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

}
