package com.javaclimb.houserent.common.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.PerformanceInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*分页配置*/
@Configuration
public class MybatisPlusConfig {
    /*mybatisPlus分页插件*/
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

    /*在控制台输出sql,这一行可以输出分页显示中查询t_house表中数据的sql语句，如果有出错的，控制台就会给出提示*/
    @Bean
    public PerformanceInterceptor performanceInterceptor() {
        return new PerformanceInterceptor();
    }
}
