package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.FeedBack;
import com.javaclimb.houserent.service.FeedBackService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//后台反馈管理器

@Controller("backendFeedBackController")
@RequestMapping("/admin/feedback")
public class FeedbackController extends BaseController {

    @Autowired
    private FeedBackService feedbackService;

    @Autowired
    private UserService userService;

    //进入反馈管理页面
    @RequestMapping("")
    public String feedback(@RequestParam(value = "page",defaultValue = "1")Long pageNumber, @RequestParam(value = "size",defaultValue = "6")Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        FeedBack condition = new FeedBack();
        //如果不是管理员，那么只查询自己的反馈内容
        //这里和其他地方一样又是查询了所有的反馈内容，等基本完结后再做修改
        if (!loginUserIsAdmin()) {
            condition.setUserId(getLoginUserId());
        }
        Page<FeedBack> feedBackPage = feedbackService.findAll(page,condition);
        model.addAttribute("pageInfo",feedBackPage);   //页码
        model.addAttribute("pagePrefix","/feedback?");   //反馈访问路径
        model.addAttribute("tab","feedback-list");
        model.addAttribute("isAdmin",loginUserIsAdmin());//这里用于添加一个属性，判断登录用户是否是管理员，如果不是在反馈列表中就不显示回复按钮
        return "admin/feedback-list";
    }

    /*反馈回复提交*//*该注释表明要返回一个Json结果，而不是地址*/
    //我清理缓存关闭浏览器之后，反馈提交的时候报了404错误，以为是路径写错了，并且查看前端控制台发现它提交的时候路径中出现了两个/admin，以为确实是路径写错了一部分，结果再次不输入回复内容的时候提交成功了吗，之后输入回复内容也能提交成功了，真是醉了
    @RequestMapping(value="/reply/submit",method= RequestMethod.POST)
    @ResponseBody
    public JsonResult feedbackReplySubmit(FeedBack feedBack) {
        feedbackService.update(feedBack);
        return JsonResult.success("您已提交反馈回复成功！");
    }

    //删除反馈
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult deleteFeedback(@RequestParam("id")Long id) {
        //上架新闻即通过id修改新闻的状态码
        try {
            FeedBack feedback = feedbackService.get(id);
            if (feedback == null) {
                return JsonResult.error("没有这个反馈，不能进行删除！");
            }
            if(!loginUserIsAdmin()) {
                return JsonResult.error("这不是你的反馈，你没有权限删除该反馈！");//这个则返回的是403页面
            }
            feedbackService.delete(feedback.getId());
        }catch (Exception e) {
            return JsonResult.error("删除反馈失败");
        }
        return JsonResult.success("删除反馈成功");
    }

}
