package com.javaclimb.houserent.controller.front;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.enums.HouseRentTypeEnums;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.common.vo.HouseSearchVO;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

//前台房子信息控制器
@Controller("frontHouseController")
public class HouseController extends BaseController {

    @Autowired
    private HouseService houseService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @RequestMapping("/house/detail/{id}")
    public String houseDetail(@PathVariable("id")Long id, Model model) {
        //根据id查询房子
        House house = houseService.get(id);
        if (house == null) {
            return renderNotFound();//返回404页面
        }
        //处理轮播图URL,将数据库中存储的图片从Json格式转换到List格式
        List<String> slideList = JSON.parseArray(house.getSlideUrl(),String.class);
        house.setSlideImgList(slideList);
        //如果是合租，查询合租房子
        List<House> shareHouseList = houseService.findByUserIdAndCertificateNoAndRentType(house.getUserId(),house.getCertificateNo(), HouseRentTypeEnums.SHARE.getValue());
        //从订单中查到租户id，把租户放到每个房子里
        if (shareHouseList != null && shareHouseList.size()>0) {
            for (House houseTemp :shareHouseList) {
                Order currentOrder = orderService.getCurrentEffectiveOrder(houseTemp.getId());
                if (currentOrder != null) {
                    //这里因为我在实体类order中对于customerId与视频中customerUserId命名不同，导致我写成currentOrder.getCustomerUserId()方法时找不到该方法，只能写成currentOrder.getCustomerUser().getId()
                    // ，但是这里不报错是因为在实体类Order中确实有customerUser这个变量但猜测由于它是一个虚拟字段导致查询数据库时查不到，从而报了null空指针异常
                    User customerUser = userService.get(currentOrder.getCustomerId());
                    currentOrder.setCustomerUser(customerUser);
                    houseTemp.setCurrentOrder(currentOrder);
                }
            }
        }
        house.setShareHouseList(shareHouseList);//这里查询合租房子，其实在合租房子图片一栏可以不止只显示当前房子缩略图的一张，根据发布用户id和房产证号相同且状态为合租时，则可以显示该用户的其他房子如A卧，B卧，C卧缩略图图片。
        model.addAttribute("house",house);
        return "front/house-detail";
    }

    //房子地图页面
    @RequestMapping("/house/map")
    public String map(@RequestParam("id")Long id,Model model) {
        //根据id查询房子
        House house = houseService.get(id);
        if (house == null) {
            return renderNotFound();
        }
        String longitudeLatitude = house.getLongitudeLatitude();
        String[] arr = longitudeLatitude.split(",");//这里因为在数据库中设计经纬度的时候是经纬度通过“，”分割开的，这里就通过逗号将经纬度划分到数组中
        model.addAttribute("longitude",arr[0]);
        model.addAttribute("latitude",arr[1]);
        model.addAttribute("address",house.getAddress());
        return "front/house-map";
    }

    //房子列表
    @RequestMapping("/house")
    public String houseList(HouseSearchVO houseSearchVO,Model model) {
        Page page = PageUtil.initMpPage(houseSearchVO.getPage(),houseSearchVO.getSize());
        Page<House> housePage = houseService.getHousePage(houseSearchVO,page);
        model.addAttribute("pageInfo",housePage);
        model.addAttribute("houseSearchVO",houseSearchVO);
        model.addAttribute("pagePrefix",houseSearchVO.getPagePrefix());
//        model.addAttribute("tab","houseRentType");
        return "front/house-list";
    }
}