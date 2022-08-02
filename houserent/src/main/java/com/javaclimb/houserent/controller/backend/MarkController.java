package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.Mark;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//我的收藏查询和取消收藏 控制器

@Controller("backendMarkController")
public class MarkController extends BaseController {
    @Autowired
    private MarkService markService;

    @Autowired
    private HouseService houseService;

    //我的收藏列表
    @RequestMapping("/admin/mark")
    public String markList(@RequestParam(value = "page",defaultValue = "1")Long pageNumber, @RequestParam(value = "size",defaultValue = "6")Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        Mark condition = new Mark();
        condition.setUserId(getLoginUserId());
        Page<Mark> markPage = markService.findAll(page,condition);
        for (Mark mark : markPage.getRecords()) {
            mark.setHouse(houseService.get(mark.getHouseId()));
        }
        model.addAttribute("pageInfo",markPage);
        model.addAttribute("tab","mark-list");
        model.addAttribute("pagePrefix","/admin/mark?");
        return "admin/mark-list";
    }

    //取消收藏提交
    @RequestMapping(value = "/admin/mark/cancel",method =  RequestMethod.POST)
    @ResponseBody
    public JsonResult cancelMark(@RequestParam("id")Long id) {
        //先判断用户是否已经登录成功
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return JsonResult.error("您当前尚未登录！");
        }
        Mark mark = markService.get(id);
        markService.delete(id);//这里之前写错将房子的id传递给该方法虽然最后返回success但数据并没有消失，猜测是因为houseId在Mark表中不唯一
        return JsonResult.success("取消收藏成功！");
    }
}

