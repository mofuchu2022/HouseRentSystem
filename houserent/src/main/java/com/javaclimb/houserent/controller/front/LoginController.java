package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.UserStatusEnums;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/*登录控制类*/
@RequestMapping("/login")
@Controller
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    /*登录提交*//*该注释表明要返回一个Json结果，而不是地址*/
    @RequestMapping(value="/submit",method= RequestMethod.POST)
    @ResponseBody
    public JsonResult loginSubmit(User user, HttpSession session) {
        if (user == null) {     //此处不知为何，前台传入空值时，debug显示结果不为NULL,直接跳过了这个return
            return JsonResult.error("没有接收到用户注册数据！");
        }
        User user1 = userService.findByUserName(user.getUserName());
        if (user1 == null) {
            return JsonResult.error("用户名不存在！");
        }
        //判断用户密码是否正确，这里又犯了一次错误，这里的不等于不能直接用！=，否则这是比较用户密码长度是否相等，而不是值是否相等，应该用！。。。.equals
        if(!user.getUserPass().equals(user1.getUserPass())) { //如果接收到的用户名存在，查询后判断密码是否相等
            return JsonResult.error("用户密码错误");
        }
        if(UserStatusEnums.DISABLE.getValue().equals(user1.getStatus())) {
            return JsonResult.error("用户已被禁用，请联系管理员");
        }
        session.setAttribute(Constant.SESSION_USE_KEY,user1);
        return JsonResult.success("登录成功！");
    }

    /*注销*//*该注释表明要返回一个Json结果，而不是地址*/
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.removeAttribute(Constant.SESSION_USE_KEY);
        session.invalidate();
        return "redirect:/";    //注销session后重定向到首页
    }

}
