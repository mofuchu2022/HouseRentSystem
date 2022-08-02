package com.javaclimb.houserent.common.schedule;

import com.javaclimb.houserent.common.enums.HouseStatusEnums;
import com.javaclimb.houserent.common.enums.OrderStatusEnums;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

//设置每分钟定时扫描正在租赁中的房子，如果到期一分钟后就结束即修改订单的租赁状态

@Component
public class TimeTask {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    //每分钟执行一次，这个注解加cron里面的内容则表示1分钟执行一次这个方法
    @Scheduled(cron = "0 */1 * * * ?")
    public void endOrderTime() {
        List<Order> list = orderService.findOverDueOrderList();
        if (list == null || list.size() == 0) {
            return;//如果没有查询到已经到期的订单就返回停止执行下面的方法
        }
        for (Order order : list) {
            //更新订单状态为已到期
            order.setStatus(OrderStatusEnums.FINISH.getValue());
            orderService.update(order);
            //同时更新房租的状态为未租出
            House house = houseService.get(order.getHouseId());
            if (house != null){
                house.setStatus(HouseStatusEnums.NOT_RENT.getValue());
                houseService.update(house);
            }
        }
    }
}
