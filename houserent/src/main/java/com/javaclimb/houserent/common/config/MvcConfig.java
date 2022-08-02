package com.javaclimb.houserent.common.config;

import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.interceptor.AdminInterceptor;
import com.javaclimb.houserent.common.interceptor.CustomerInterceptor;
import com.javaclimb.houserent.common.interceptor.OwnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/*前端配置类*/
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {

   /*配置静态资源访问路径,这里不配置会出现访问不到例如样式资源resources的static.assets中文件的信息路径*/
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/uploads/**").addResourceLocations("file:///"+ Constant.UPLOADS_PATH);
    }

    /*配置jsp的访问前后缀*/
    @Bean
    public InternalResourceViewResolver setupViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    //通过调用拦截类对一些不符合登录要求的用户页面访问进行拦截，符合要求后相当于是放行了，如果不配置就一样访问不了
    //这里adminInterCeptor拦截的/11页面并不存在，添加这个的原因在于如果什么都不添加那么默认会拦截所有页面
    //这里权限越多的用户写在越后面，权限低级用户添加的拦截后面不需要再赘写，只添加独有的需要拦截的页面
    //这里的拦截条件都会进行统一判断
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new CustomerInterceptor())
                .addPathPatterns("/admin/profile")
                .addPathPatterns("/admin/order")
                .addPathPatterns("/admin/mark")
                .addPathPatterns("/admin/home")
                .addPathPatterns("/admin/feedback")
                .addPathPatterns("/admin/password");
        registry.addInterceptor(new OwnerInterceptor())
                .addPathPatterns("/admin/house");
        registry.addInterceptor(new AdminInterceptor())
                .addPathPatterns("/admin/news")
                .addPathPatterns("/admin/user");
    }

}
