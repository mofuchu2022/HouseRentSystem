package com.javaclimb.houserent.common.base;

/*所有controller控制器的基类
* */

import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.enums.UserRoleEnums;
import com.javaclimb.houserent.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BaseController {

    @Autowired
    protected HttpServletRequest request;

    /*获得当前登录用户*/
    public User getLoginUser() {
        User user = (User) request.getSession().getAttribute(Constant.SESSION_USE_KEY);
        return user;
    }

    //获取当前登录用户的数据库id
    public Long getLoginUserId(){
        User user = getLoginUser();
        if (user==null) {
            return null;
        }
        return user.getId();
    }

    //判断当前用户是否为管理员
    public Boolean loginUserIsAdmin() {
        User user = getLoginUser();
        if(user==null) {
            return false;
        }
        return UserRoleEnums.ADMIN.getValue().equalsIgnoreCase((user.getRole()));   //如果用户存在，则判断用户的角色为Admin时则返回的结果时true，否则时false
    }

    //判断当前用户是否为租客
    public Boolean loginUserIsCustomer() {
        User user = getLoginUser();
        if(user==null) {
            return false;
        }
        return UserRoleEnums.CUSTOMER.getValue().equalsIgnoreCase((user.getRole()));   //如果用户存在，则判断用户的角色为Admin时则返回的结果时true，否则时false
    }

    //判断当前用户是否为房东
    public Boolean loginUserIsOwner() {
        User user = getLoginUser();
        if(user==null) {
            return false;
        }
        return UserRoleEnums.OWNER.getValue().equalsIgnoreCase((user.getRole()));   //如果用户存在，则判断用户的角色为Admin时则返回的结果时true，否则时false
    }

    //渲染404页面
    public String renderNotFound() {
        return "forward:/404";
    }

    //没有访问权限
    public String renderNotAllowAccess() {
        return "forward:/403";
    }

    //服务器异常错误
    public String renderServerException() {
        return "forward:/500";
    }

    //系统其他错误
    public String renderError() {
        return "forward:/error";
    }
 }
