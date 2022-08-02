package com.javaclimb.houserent.controller.backend;

//个人信息控制器

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/profile")
public class ProfileController extends BaseController {
    @Autowired
    private UserService userService;

    //个人信息页面
    //这里因为缺少再次配置RequestMapping方法导致前端传到这里没能进入到profile方法从而转发不到my-profile页面造成404错误。
    @RequestMapping("")
    public String profile(Model model) {
        System.out.println("进入了个人信息profile方法！");
        User user = getLoginUser();
        model.addAttribute("user",user);
        model.addAttribute("tab","my-profile");//这个tab应该是一个标识，当用户点击了进入这个方法的按钮后，将tab标志转发到admin/my-profile页面，从而显示选中页面按钮高亮效果
        return "admin/my-profile";
    }

    //个人信息修改保存提交功能
    @RequestMapping(value = "/submit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submitProfile(User user, HttpSession httpSession) {
        user.setId(getLoginUserId());
        userService.update(user);
        httpSession.setAttribute(Constant.SESSION_USE_KEY,userService.get(getLoginUserId()));
        return  JsonResult.success("个人信息修改成功！");
    }
}
