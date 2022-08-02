package com.javaclimb.houserent.common.interceptor;

import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//租客接口拦截器
//这个的意思是只要用户进行登录就可以访问其对应权限的所有页面，权限等级最低
@Component
public class CustomerInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        User user = (User)request.getSession().getAttribute(Constant.SESSION_USE_KEY);
        //如果用户尚未登录，进行拦截
        if (user == null) {
            response.sendRedirect("/403");
            return false;
        }
        return true;
    }
}