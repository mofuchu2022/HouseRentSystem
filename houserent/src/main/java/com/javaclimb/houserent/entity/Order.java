package com.javaclimb.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.javaclimb.houserent.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;

//订单实体类

@Data
@TableName("t_order")
public class Order extends BaseEntity {
    //租客用户id
    private Long customerId;

    //房东用户id
    private Long ownerUserId;

    //房子id
    private Long houseId;

    //订单状态: -3 已取消 -2 待签合同 -1 待付款 0 生效中 1 已到期 2退租申请 3 退租申请不通过
    private Integer status;

    //月租金
    private Integer monthRent;

    //租住天数
    private Integer dayNum;

    //总金额
    private Integer totalAmount;

    //开始日趋
    private Date startDate;

    //结束日期
    private Date endDate;

    //房子信息
    @TableField(exist = false)
    private House house;

    //租客用户信息
    @TableField(exist = false)
    private User customerUser;

    //房东用户信息
    @TableField(exist = false)
    private User ownerUser;

}
