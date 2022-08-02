package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.common.enums.OrderStatusEnums;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.mapper.OrderMapper;
import com.javaclimb.houserent.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

//订单服务实现方法
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;


    //Mapper对象
    @Override
    public BaseMapper<Order> getRepositorty() {
        return orderMapper;
    }


    //获取查询器
    @Override
    public QueryWrapper<Order> getQueryWrapper(Order order) {
        return null;
    }


    //获取带参数的查询器
    @Override
    public QueryWrapper<Order> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    //查询当前有效订单，即签订了合同且未过期的订单
    @Override
    public Order getCurrentEffectiveOrder(Long houseId) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("house_id",houseId);
        queryWrapper.eq("status", OrderStatusEnums.NORMAL);
        return orderMapper.selectOne(queryWrapper);
    }

    @Override
    public List<Order> findOverDueOrderList() {
        return orderMapper.findOverDueOrderList();
    }
}
