package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.UserStatusEnums;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Objects;

//用户状态控制器

@Controller
public class UserController extends BaseController {

    @Autowired
    private UserService userService;//这里因为忘记Autowired注解了，导致服务器报了500错误，而确实可以看到虽然使用了但没有注解时它是灰色的

    //用户列表
    @RequestMapping("/admin/user")
    public String user(@RequestParam(value = "page",defaultValue = "1")Long pageNumber, @RequestParam(value = "size",defaultValue = "6")Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        User condition = new User();
        Page<User> userPage = userService.findAll(page,condition);
        model.addAttribute("pageInfo",userPage);
        model.addAttribute("pagePrefix","/admin/user?");
        model.addAttribute("tab","user-list");
        return "admin/user-list";
    }

    //用户禁用
    @RequestMapping("/admin/user/disable")
    @ResponseBody
    public JsonResult disableUser(@RequestParam("id")Long id) {
        //上架房子即通过id修改房子的状态码
        try {
            User user = userService.get(id);
            if (user == null) {
                return JsonResult.error("用户不存在，不能进行禁用！");
            }
            if(!loginUserIsAdmin()) {
                return JsonResult.error("你没有禁用用户权限！");//这个则返回的是403页面
            }
            user.setStatus(UserStatusEnums.DISABLE.getValue());
            userService.update(user);
        }catch (Exception e) {
            return JsonResult.error("用户禁用失败");
        }
        return JsonResult.success("用户禁用成功");
    }

    //用户启用
    @RequestMapping("/admin/user/enable")
    @ResponseBody
    public JsonResult enableUser(@RequestParam("id")Long id) {
        //上架房子即通过id修改房子的状态码
        try {
            User user = userService.get(id);
            if (user == null) {
                return JsonResult.error("用户不存在，不能进行启用！");
            }
            if(!loginUserIsAdmin()) {
                return JsonResult.error("你没有启用权限！");//这个则返回的是403页面
            }
            user.setStatus(UserStatusEnums.ENABLE.getValue());
            userService.update(user);
        }catch (Exception e) {
            return JsonResult.error("用户启用失败");
        }
        return JsonResult.success("用户启用成功");
    }

    //进入密码修改页面
    @RequestMapping("/admin/password")
    public String password(Model model) {
        model.addAttribute("tab","user-passwordEdit");
        return "admin/password";
    }

    //修改密码
    @RequestMapping(value = "/admin/password/edit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult passwordEdit(@RequestParam("oldPassword")String oldPassword, @RequestParam("newPassword")String newPassword,
                                   @RequestParam("confirmPassword")String confirmPassword, HttpSession session) {
            //因为这里的三个参数是临时的，实体类后台并不存在，但前端确实需要用到这样的参数，则不能直接使用User接收，而要定义三个同名的请求参数
        if ((oldPassword.length() == 0) || (newPassword.length() == 0) || (confirmPassword.length() == 0)) {
            return JsonResult.error("您输入的密码不能为空！");
        }
        if (!Objects.equals(newPassword,confirmPassword)) {
            return JsonResult.error("您两次输入的新密码不一致，请重新输入");
        }
        User user = userService.get(getLoginUserId());
        if (user == null || !Objects.equals(user.getUserPass(),oldPassword)) {
            return JsonResult.error("您输入的旧密码与原来的密码不一致，请重新输入！");
        }
        user.setUserPass(newPassword);
        userService.update(user);
        session.setAttribute(Constant.SESSION_USE_KEY,userService.get(getLoginUserId()));
        return JsonResult.success("用户密码修改成功");
    }
}
