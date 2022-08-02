package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.HouseStatusEnums;
import com.javaclimb.houserent.common.enums.OrderStatusEnums;
import com.javaclimb.houserent.common.util.DateUtil;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Objects;

//后端订单控制器

@Controller("backendOrderController")
@RequestMapping("/admin/order")
public class OrderController extends BaseController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    //订单列表
    @RequestMapping("")
    public String allOrder(@RequestParam(value = "page",defaultValue = "1")Long pageNumber, @RequestParam(value = "size",defaultValue = "6")Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Order condition = new Order();
        //这里有bug，可以看到获取的的condition中用户id是登录用户id，但查询结果却不分用户id查询出了所有订单，问题很大，还没解决
        //如果登录用户是租客，则查询租客的订单
        if(loginUserIsCustomer()) {
            condition.setCustomerId(getLoginUserId());
        }
        //如果登录用户是房东，则查询房东的订单
        if (loginUserIsOwner()) {
            condition.setOwnerUserId(getLoginUserId());
        }
        System.out.println("这是订单中获得condition ： "+condition);
        //如果登录用户是管理员，这里不直接进行设置默认为other=admin，查询所有订单
        Page<Order> orderPage = orderService.findAll(page,condition);
        for (Order order: orderPage.getRecords()) {
            //todo:这个地方性能可以优化: 优化方案 id(in) (1,2,3)
            order.setHouse(houseService.get(order.getHouseId()));
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
            order.setCustomerUser(userService.get(order.getCustomerId()));//在循环里边做查询性能较差
        }
        model.addAttribute("pageInfo",orderPage);
        model.addAttribute("tab","order-list");
        model.addAttribute("pagePrefix","/admin/order?");//这里因为/admin/order中缺少了第一个/导致分页功能在除查看第一页订单时都出现了404页面
        return "admin/order-list";
    }

    //取消订单
    @RequestMapping(value = "/cancel",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult orderCancel(@RequestParam("orderId")Long orderId) {
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在！");
        }
        //登录用户不是管理员或者非该订单的租客、房东则不能取消订单
        if (!loginUserIsAdmin()&&!Objects.equals(getLoginUserId(),order.getCustomerId())&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())) {
            return JsonResult.error("您没有权限取消该订单！");
        }
        order.setStatus(OrderStatusEnums.CUSTOMER_CANCEL.getValue());
        orderService.update(order);
        return JsonResult.success("订单取消成功！");
    }

    //申请退租
    @RequestMapping(value = "/end",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrder(@RequestParam("orderId")Long orderId) {
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在！");
        }
        //登录用户不是管理员或者非该订单的租客、房东则不能取消订单
        if (!loginUserIsAdmin()&&!Objects.equals(getLoginUserId(),order.getCustomerId())&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())) {
            return JsonResult.error("您没有权限审核该订单！");
        }
        order.setStatus(OrderStatusEnums.END_APPLY.getValue());
        orderService.update(order);
        return JsonResult.success("退租已经申请，请等待房东审核！");
    }

    //审核退租通过
    @RequestMapping(value = "/endPass",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrderPass(@RequestParam("orderId")Long orderId) {
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在！");
        }
        //登录用户不是管理员或者非该订单房东则不能取消订单
        if (!loginUserIsAdmin()&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())) {
            return JsonResult.error("您没有权限审核该订单！");
        }
        order.setStatus(OrderStatusEnums.FINISH.getValue());
        Date date = new Date();
        int dayNum = DateUtil.daysBetween(order.getStartDate(),date);
        order.setDayNum(dayNum);
        order.setTotalAmount(order.getMonthRent()/30*dayNum);
        order.setEndDate(date);
        orderService.update(order);
        //重置房子状态为未租出
        House house = houseService.get(order.getHouseId());
        if (house!= null && Objects.equals(house.getStatus(), HouseStatusEnums.HAS_RENT.getValue())) {
            house.setStatus(HouseStatusEnums.NOT_RENT.getValue());
            house.setLastOrderEndTime(date);//一定要记得在修改值放到对象中之后要调用更新语句同步更新数据库中的信息！！！
            houseService.update(house);
        }
        return JsonResult.success("退租申请审核通过成功！");
    }

    //审核退租不通过
    @RequestMapping(value = "/endNotPass",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrderNotPass(@RequestParam("orderId")Long orderId) {
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在！");
        }
        //登录用户不是管理员或者非该订单的租客、房东则不能取消订单
        if (!loginUserIsAdmin()&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())) {
            return JsonResult.error("您没有权限审核该订单！");
        }
        order.setStatus(OrderStatusEnums.END_APPLY_REJECT.getValue());
        orderService.update(order);
        return JsonResult.success("退租申请审核不通过成功！");
    }

}
