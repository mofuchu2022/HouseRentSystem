package com.javaclimb.houserent.controller.front;

/*
*   前端首页控制类
* */


import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.enums.HouseRentTypeEnums;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/*初次写，该类少了@Controller导致页面访问不到*/
@Controller
public class IndexController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    /*前端首页*/
    @RequestMapping("/")
    public  String index(Model model) {
        //首页显示最新整租房子
        model.addAttribute("recentWholeHouseList",houseService.findTopList(HouseRentTypeEnums.WHOLE.getValue(), Constant.INDEX_HOUSE_NUM));
       //首页显示最新合租房子
        model.addAttribute("recentShareHouseList",houseService.findTopList(HouseRentTypeEnums.SHARE.getValue(), Constant.INDEX_HOUSE_NUM));
        model.addAttribute("tab","houseIndex");
        return "front/index";
    }

}
