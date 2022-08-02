package com.javaclimb.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.javaclimb.houserent.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;
import java.util.List;

/*房子信息实体表*/
@Data
@TableName("t_house")
public class House extends BaseEntity {
    /*房东用户id，这里变量名称要遵循驼峰命名法，即首单词开头字母小写后，其余后续单词以大写进行开头*/
    private Long userId;

   //租房类型
   private String rentType;

    //房屋名称
    private String title;

    //房屋详情描述
    private String content;

    //城市名称
    private String city;

    //租房地址
    private String address;

    //缩略图地址
    private String thumbnailUrl;

    //轮播图地址
    private String slideUrl;

    //月租金额
    private Integer monthRent; //这里拼写错误成monthERecent过，导致数据库保存的数据由于没有进行异常校验，出现保存结果为空的后果，一定要注意别再犯

    //房屋状态 状态：0未租出，1已租出，-1已下架 -2待审核 -3审核不通过
    private Integer status;

    //房产证号
    private String certificateNo;

    //卫生间数量
    private Integer toiletNum;

    //厨房数量
    private Integer kitchenNum;

    //客厅数量
    private Integer livingRoomNum;

    //卧室数量
    private Integer bedroomNum;

    //是否有空调
    private int hasAirConditioner;

    //面积
    private double area;

    //当前所在层数
    private Integer floor;

    //房子最大楼层数
    private Integer maxFloor;

    //是否有电梯
    private Integer hasElevator;

    //建成年份
    private Integer buildYear;

    //朝向
    private String direction;

    //上次开始入住时间
    private Date lastOrderStartTime;

    //上次结束入住时间
    private Date lastOrderEndTime;

    //经纬度
    private String longitudeLatitude;

    //联系人姓名
    private String contactName;

    //联系人电话
    private String contactPhone;

    //轮播图列表属性，这里加上@tablefield注解用于声明该字段在数据库表中并不存在，防止该字段影响到MyBatisPlus的修改数据操作
    @TableField(exist = false)
    private List<String> slideImgList;

    //合租房子列表
    @TableField(exist = false)
    private List<House> shareHouseList;

    //该房子的订单
    @TableField(exist = false)
    private Order currentOrder;
}
