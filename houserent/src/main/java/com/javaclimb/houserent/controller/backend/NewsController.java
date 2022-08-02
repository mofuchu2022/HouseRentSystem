package com.javaclimb.houserent.controller.backend;

import cn.hutool.http.HtmlUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.News;
import com.javaclimb.houserent.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;


/*新闻控制管理器*/
@Controller("backendNewsController")
@RequestMapping("/admin/news")
public class NewsController extends BaseController {
    @Autowired
    private NewsService newsService;  //这里漏写了@Autowired注解，导致前台数据传送到发布新闻提交方法后，无法添加到数据库直接返回错误，这个注解的作用是自动装配newsService不用手动new该对象
    
   /*进入后台新闻的管理页面,这里因为有两个同名newsList方法导致前端默认访问了第一个方法，查不出来数据也不返回错误*/
    @RequestMapping("")
    public String newsList(@RequestParam(value = "page",defaultValue = "1")Long pageNumber,@RequestParam(value = "size",defaultValue = "6")Long pageSize,Model model) {
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        News condition = new News();
        Page<News> newsPage = newsService.findAll(page,condition);
        model.addAttribute("pageInfo",newsPage);   //页码
        model.addAttribute("pagePrefix","/admin/news?");   //新闻访问路径
        model.addAttribute("tab","news-list");
        return "admin/news-list";
    }

    /*进入后台新闻的发布页面*/
    @RequestMapping("/publish")
    public String publish(@RequestParam(value = "id",required = false)Long id,Model model) {
        News news = new News();
        //编辑页面
        if(id!=null) {
            news = newsService.get(id);
            if (news == null) {
                return renderNotFound();//这个返回的是404页面
            }
        }
        model.addAttribute("news",news);
        return "admin/news-publish";
    }

    //发布新闻信息
    @RequestMapping(value = "/publish/submit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(News news) {
    //这里的参数key为FileUtil中的session key
        try {
            if(news.getId() == null) { //编辑的时候id不为空，设置时间和房屋主人也不为空，则不用重新进行设置，这里表示新闻id为空则进行设置
                news.setCreateTime(new Date());
                //这里在第一次创建新闻的时候，出现了异常，经过debug发现id可能创建的有问题，后查看表的设计果然是忘记设置id自动增长导致的，设置后问题解决
            }else {
                News queryNews = newsService.get(news.getId());
                if (queryNews == null) {
                    return JsonResult.error("编辑失败，没有这个新闻资讯");
                }
            }
            //获取发布新闻中的字符,如果新闻内容的字数大于规定Constant中的摘要字数，则取这个规定的字数为摘要
            String summaryText = HtmlUtil.cleanHtmlTag(news.getContent());
            if (summaryText.length()>Constant.POST_SUMMARY_NUM) {
                String summary = summaryText.substring(0,Constant.POST_SUMMARY_NUM);
                news.setSummary(summary);
            }else {
                news.setSummary(summaryText);
            }
            newsService.insertOrUpdate(news);
        }catch (Exception e) {
            return JsonResult.error("发布失败，请填写完整信息");
        }
        return JsonResult.success("发布成功",news.getId());
    }

    //删除新闻
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult deletenews(@RequestParam("id")Long id) {
        //上架新闻即通过id修改新闻的状态码
        try {
            News news = newsService.get(id);
            if (news == null) {
                return JsonResult.error("没有这个新闻，不能进行删除！");
            }
            if(!loginUserIsAdmin()) {
                return JsonResult.error("这不是你的新闻，你没有权限删除该新闻！");//这个则返回的是403页面
            }
            newsService.delete(news.getId());
        }catch (Exception e) {
            return JsonResult.error("删除新闻失败");
        }
        return JsonResult.success("删除新闻成功");
    }

}
