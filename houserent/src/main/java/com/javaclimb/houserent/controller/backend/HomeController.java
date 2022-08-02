package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.enums.OrderStatusEnums;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//我的家控制器

@Controller("backHomeController")
public class HomeController extends BaseController {
    @Autowired
    private HouseService houseService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    //租客房子的信息列表，我的家
    @RequestMapping("/admin/home")
    public String home(@RequestParam(value = "page",defaultValue = "1")Long pageNumber, @RequestParam(value = "size",defaultValue = "6")Long pageSize, Model model){
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        Order condition = new Order();
        condition.setCustomerId(getLoginUserId());
        condition.setStatus(OrderStatusEnums.NORMAL.getValue());
        Page<Order> orderPage = orderService.findAll(page,condition);
        //这里查询结果还是该状态的所有房子，这样应该是默认生成的查询语句有问题，导致查询结果不完全正确
        //在控制台可以看到不管怎么查，查询语句的都查的是id为6用户的
        for (Order order: orderPage.getRecords()) {
            order.setHouse(houseService.get(order.getHouseId()));
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
        }
        model.addAttribute("pageInfo",orderPage);
        model.addAttribute("tab","home");
        model.addAttribute("pagePrefix","/admin/home?");
        return "/admin/my-home";
    }
}
