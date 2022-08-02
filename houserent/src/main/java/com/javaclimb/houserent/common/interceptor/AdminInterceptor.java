package com.javaclimb.houserent.common.interceptor;

import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.enums.UserRoleEnums;
import com.javaclimb.houserent.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//管理员接口拦截器
//管理员默认可以访问所有页面，只进行身份的校验
@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        User user = (User)request.getSession().getAttribute(Constant.SESSION_USE_KEY);
        //如果用户尚未登录，进行拦截,如果用户登录身份不是管理员，拦截
        if (user == null ||!UserRoleEnums.ADMIN.getValue().equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("/403");
            return false;
        }
        return true;



    }



}