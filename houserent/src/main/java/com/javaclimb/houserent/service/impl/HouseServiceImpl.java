package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.vo.HouseSearchVO;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.mapper.HouseMapper;
import com.javaclimb.houserent.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static org.apache.logging.log4j.util.Strings.isNotEmpty;

/*房屋服务接口实现*/

@Service
public class HouseServiceImpl implements HouseService {
    @Autowired
    private HouseMapper houseMapper;

    /*mapper对象*/
    @Override
    public BaseMapper<House> getRepositorty() {
        return houseMapper;
    }

    /*获得查询器*/
    @Override
    public QueryWrapper<House> getQueryWrapper(House house) {
        QueryWrapper<House> queryWrapper = new QueryWrapper<>();
        if (house!=null&&house.getUserId()!=null) {
            queryWrapper.eq("user_id",house.getUserId());
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<House> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    //根据用户id和房产证编号查询合租房子
    @Override
    public List<House> findByUserIdAndCertificateNoAndRentType(Long userId,String certificateNo,String rentType) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_id",userId);
        queryWrapper.eq("certificate_no",certificateNo);
        queryWrapper.eq("rent_type",rentType);//这里的rent_type参数其实就是数据库中的rent_type参数，出现查询不到该字段的原因就是因为写成了rentType导致在生成的SQL语句where条件的rent_Type变成了rentType与数据库字段不符合。
        return houseMapper.selectList(queryWrapper);
    }

    //根据出租类型查询最新的n条房子信息
    @Override
    public List<House> findTopList(String rentType, Integer limit) {
        return houseMapper.findTopList(rentType,limit);
    }

    //首页查看更多房子获取分页数据
    @Override
    public Page<House> getHousePage(HouseSearchVO houseSearchVO, Page<House> page) {
        if (houseSearchVO == null) {
            houseSearchVO = new HouseSearchVO();
        }else{
            //价格范围
            String priceRange = houseSearchVO.getPriceRange();//通过用户选择的房租范围将首尾两个值以数据的方式传进来，0的位置就是最小房租，1的位置就是最大房租，两者之间就是房租范围
            Integer minPrice = 0;
            Integer maxPrice = 20000;
            if (isNotEmpty(priceRange)) {
                String[] arr = priceRange.split(";");
                if (arr.length == 2){
                    minPrice = Integer.valueOf(arr[0]);
                    maxPrice = Integer.valueOf(arr[1]);
                }
            }
            houseSearchVO.setMinPrice(minPrice);
            houseSearchVO.setMaxPrice(maxPrice);
            //面积范围
            String areaRange = houseSearchVO.getAreaRange();//通过用户选择的房租范围将首尾两个值以数据的方式传进来，0的位置就是最小房租，1的位置就是最大房租，两者之间就是房租范围
            Integer minArea = 0;
            Integer maxArea = 150;
            if (isNotEmpty(areaRange)) {
                String[] arr = areaRange.split(";");
                if (arr.length == 2){
                    minArea = Integer.valueOf(arr[0]);
                    maxArea = Integer.valueOf(arr[1]);
                }
            }
            houseSearchVO.setMinArea(minArea);
            houseSearchVO.setMaxArea(maxArea);
        }
        List<House> list = houseMapper.searchHouse(houseSearchVO,page);
        page.setRecords(list);
        return page;
    }

}
