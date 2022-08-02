package com.javaclimb.houserent.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.News;
import com.javaclimb.houserent.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/*新闻前台控制管理器*/
@Controller("frontNewsController")
@RequestMapping("")
public class NewsController extends BaseController {
    @Autowired
    private NewsService newsService;  //这里漏写了@Autowired注解，导致前台数据传送到发布新闻提交方法后，无法添加到数据库直接返回错误，这个注解的作用是自动装配newsService不用手动new该对象
    
   /*进入前台新闻的管理页面,这里因为有两个同名newsList方法导致前端默认访问了第一个方法，查不出来数据也不返回错误*/
    @RequestMapping("/news")
    public String newsList(@RequestParam(value = "page",defaultValue = "1")Long pageNumber,@RequestParam(value = "size",defaultValue = "6")Long pageSize,Model model) {
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        News condition = new News();
        Page<News> newsPage = newsService.findAll(page,condition);
        model.addAttribute("pageInfo",newsPage);   //页码
        model.addAttribute("pagePrefix","/news?");   //新闻访问路径
        model.addAttribute("tab","news-list");
        return "front/news-list";
    }

    /*进入新闻详情页面*/
    @RequestMapping("/news/detail/{id}")
    public String newsDetails(@PathVariable(value = "id",required = false)Long id, Model model) {
        News news = newsService.get(id);
        if (news == null) {
            return renderNotFound();
        }
        model.addAttribute("news",news);
        model.addAttribute("tab","news-list");
        return "front/news-detail";
    }

}
