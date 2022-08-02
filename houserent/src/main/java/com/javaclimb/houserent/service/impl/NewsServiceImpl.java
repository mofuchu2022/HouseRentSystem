package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.News;
import com.javaclimb.houserent.mapper.NewsMapper;
import com.javaclimb.houserent.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

//新闻资讯实现类

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public BaseMapper<News> getRepositorty() {
        return newsMapper;
    }

    //获得查询器
    @Override
    public QueryWrapper<News> getQueryWrapper(News news) {
        QueryWrapper<News> queryWrapper = new QueryWrapper();
        return queryWrapper;
    }

    @Override
    public QueryWrapper<News> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }
}
