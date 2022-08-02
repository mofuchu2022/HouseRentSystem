package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.FeedbackStatusEnums;
import com.javaclimb.houserent.entity.FeedBack;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.FeedBackService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

//用户反馈前端控制器

@Controller("frontFeedBackController")
public class FeedBackController extends BaseController {

    @Autowired
    private FeedBackService feedBackService;

    @Autowired
    private UserService userService;

    //转发到反馈页面
    @RequestMapping("/feedback")
    public String feedBack(Model model) {
        model.addAttribute("tab","feedback");
        return "/front/feedback";
    }

    //反馈提交
    //这里不知道为什么使用FeedBack对象接受传来的值为null
//    @RequestMapping(value = "/feedback/submit",method = RequestMethod.POST)
//    @ResponseBody
//    public JsonResult feedbackSubmit(@RequestParam("contactName")String contactName,
//                                     @RequestParam("contactEmail")String contactEmail,
//                                     @RequestParam("title")String title,
//                                     @RequestParam("content")String content) {
//        //首先判断用户是否登录
//        User loginUser = getLoginUser();
//        if (loginUser == null) {
//            return  JsonResult.error("您还没有登录，不能提交反馈哦！");
//        }
//        FeedBack feedBack = new FeedBack();
//        feedBack.setContactName(contactName);
//        feedBack.setContactEmail(contactEmail);
//        feedBack.setTitle(title);
//        feedBack.setContent(content);
//        feedBack.setCreateTime(new Date());
//        feedBack.setUserId(loginUser.getId());
//        feedBack.setStatus(FeedbackStatusEnums.NOT_HANDLE.getValue());
//        feedBackService.insert(feedBack);
//        return JsonResult.success("反馈已提交，请等待管理员处理哦亲！");
//    }

    //反馈提交
    //这里不知道为什么使用FeedBack对象接受传来的值为null
    //因为这里视频里用的是RequestParam传参的方式，写起来比较复杂，我尝试用一个FeedBack对象进行接受，但接受值为Null，以为是什么语法错误，或者用错了
    //最后发现是因为前端的表单没有放到form表单中，这就导致在使用FeedBack对象接受时接受的值为null，而使用具体的请求参数时直接前台报了400错误，控制台这里报了警告信息
    //经过修改后，两种方法都能成功进行反馈参数的插入
    @RequestMapping(value = "/feedback/submit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult feedbackSubmit(FeedBack feedBack) {
        //首先判断用户是否登录
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return  JsonResult.error("您还没有登录，不能提交反馈哦！");
        }
        feedBack.setCreateTime(new Date());
        feedBack.setUserId(loginUser.getId());
        feedBack.setStatus(FeedbackStatusEnums.NOT_HANDLE.getValue());
        feedBackService.insert(feedBack);
        return JsonResult.success("反馈已提交，请等待管理员处理哦亲！");
    }

}
