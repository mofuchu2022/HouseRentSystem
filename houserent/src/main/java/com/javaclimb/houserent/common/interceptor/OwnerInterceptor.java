package com.javaclimb.houserent.common.interceptor;

import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.enums.UserRoleEnums;
import com.javaclimb.houserent.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//房东接口拦截器
//这个的意思是还要判断登录用户是否为租客，是则进行拦截否则为房东或者管理员则不拦截其可以访问的页面
@Component
public class OwnerInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        User user = (User)request.getSession().getAttribute(Constant.SESSION_USE_KEY);
        //如果用户尚未登录，进行拦截,如果用户登录身份是租客，拦截
        if (user == null ||UserRoleEnums.CUSTOMER.getValue().equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("/403");
            return false;
        }
        return true;



    }



}