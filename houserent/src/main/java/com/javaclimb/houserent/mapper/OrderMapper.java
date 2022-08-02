package com.javaclimb.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

//订单mapper
@Mapper
public interface OrderMapper extends BaseMapper<Order> {
        //查询到期的订单,这里通过查询t_order表中状态为生效的订单，并且已经到期的时候则在此时通过Schedule包中的定时任务进行订单状态的更新
    @Select("select * from t_order where status = 0 and end_date<now()")
    List<Order> findOverDueOrderList();
}
