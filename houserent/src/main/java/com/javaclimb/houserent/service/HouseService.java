package com.javaclimb.houserent.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseService;
import com.javaclimb.houserent.common.vo.HouseSearchVO;
import com.javaclimb.houserent.entity.House;

import java.util.List;

/*房子服务接口*/
public interface HouseService extends BaseService<House,Long> {
    //根据用户id和房产证编号查询合租房子
    List<House> findByUserIdAndCertificateNoAndRentType(Long userId,String certificateNo,String rentType);

    //根据出租类型首页显示最新的几条租房信息
    public List<House> findTopList(String rentType,Integer limit);

    //首页查看更多获得房子分页数据
    Page<House> getHousePage(HouseSearchVO houseSearchVO,Page<House> page);
}
