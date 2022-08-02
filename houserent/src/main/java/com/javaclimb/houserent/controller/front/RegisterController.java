package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/*注册控制类*/
@RequestMapping("/register")
@Controller
public class RegisterController extends BaseController {

    @Autowired
    private UserService userService;

    /*注册提交*//*该注释表明要返回一个Json结果，而不是地址*/
    @RequestMapping(value="/submit",method= RequestMethod.POST)
    @ResponseBody
    public JsonResult registerSubmit(User user, HttpSession session) {
        if (user == null) {
            return JsonResult.error("没有接收到用户注册数据！");
        }
        User user1 = userService.findByUserName(user.getUserName());
        if (user1 != null) {
            return JsonResult.error("用户名已存在！！");
        }

        user.setIdCard("身份证号还没有填写！");
        user.setUserAvatare("/assets/img/user-3.jpg");//这里经过二次校验时发现MySql数据库的Navicat界面user表显示不了这个属性字段信息，容易发现user_avatar应该是被折叠了，但是没有发现解决的方法，随后重命名字段和实体类以及这个Controller类中的名称，然后重命名前端页面接受头像字段的属性和修改后的字段名称相同后可以在Navicat数据表中正常显示了
        user.setUserDesc("个人描述还未填写！");
        user.setSex("尚未填写性别！");
        user.setHobby("暂未填写爱好！");
        user.setJob("尚未填写职业！");
        user.setCreateTime(new Date());
       try{
           userService.insert(user);
       }catch (Exception e) {
           e.printStackTrace();
           return JsonResult.error("抱歉，注册失败！");
       }
        session.setAttribute(Constant.SESSION_USE_KEY,user);
       return JsonResult.success("恭喜你，注册成功！");
    }
}
