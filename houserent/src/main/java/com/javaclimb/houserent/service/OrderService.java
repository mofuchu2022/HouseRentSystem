package com.javaclimb.houserent.service;

import com.javaclimb.houserent.common.base.BaseService;
import com.javaclimb.houserent.entity.Order;

import java.util.List;

//订单服务的实现类

public interface OrderService extends BaseService<Order,Long> {
    //查询当前订单
    public Order getCurrentEffectiveOrder(Long houseId);

    //查询到期的订单,这里通过查询t_order表中状态为生效的订单，并且已经到期的时候则在此时通过Schedule包中的定时任务进行订单状态的更新
    List<Order> findOverDueOrderList();
}
