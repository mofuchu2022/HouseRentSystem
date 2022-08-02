package com.javaclimb.houserent.common.vo;

import lombok.Data;

//房子搜索封装参数
//这里的 搜索语句配置在resource中mapper文件中的HouseMapper.xml文件中，因为application.yml文件中的
//mybatis-plus:
//  mapper-locations: classpath*:/mapper/**Mapper.xml
//是在这样的目录下进行文件的扫描的

@Data
public class HouseSearchVO {
    //页码
    private Integer page = 1;
    //页大小
    private Integer size = 6;
    //房子租赁状态，0代表未租出
    private Integer status = 0;
    //地址关键字
    private String address = "";
    //城市名称
    private String city = "";
    //租房类型
    private String rentType = "";
    //月租金范围，已分号分割";",这个设定的默认值会影响到在地址栏中不传参数时默认查询的值范围，所以如果只是根据租房类型查询时最好值的范围不限，这里默认范围为0-20000
    private String priceRange = "0;20000";
    //最小价格
    private Integer minPrice = 0;
    //最大价格
    private Integer maxPrice = 20000;
    //面积范围，已分号分割";"
    private String areaRange = "0;150";
    //最小面积
    private Integer minArea = 0;
    //最大面积
    private Integer maxArea = 20000;

    //获得分页前缀参数
    //这个获取的值用于传给page.jsp的对应PagePrefix参数，从而可已正常使用上一页和下一页的功能
    public String getPagePrefix() {
        StringBuffer sb = new StringBuffer();
        sb.append("?address=").append(this.address);
        sb.append("&rentType=").append(this.rentType);
        sb.append("&priceRange=").append(this.priceRange);
        sb.append("&areaRange=").append(this.areaRange);
        return sb.toString();
    }

}
