package com.javaclimb.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.vo.HouseSearchVO;
import com.javaclimb.houserent.entity.House;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/*房子数据访问类*/

@Mapper
public interface HouseMapper extends BaseMapper<House> {
    //像这种出租类型获取最新的n条房子信息
    //的sql查询语句比较简单，可以直接用注解的方式在方法中写
    //因为要在首页进行展示，所以查询出的房子都是未租出类型的，租住类型根据具体进行判断，通过创建时间进行降序，显示的条数为设定的limit值
   // @Select("select * from t_house where status = 0 and rent_type = #(rentType) order by create_time desc limit #{limit}")
    //这里因为在用“#”取值rentType时，将{}写成了()导致了数组越界问题，前端报了500错误
    //报错问题为:java.sql.SQLException: Parameter index out of range (1 > number of parameters, which is 0).
    @Select("select * from t_house where status = 0 and rent_type = #{rentType} order by create_time desc limit #{limit}")
    public List<House> findTopList(@Param("rentType")String rentType,@Param("limit")Integer limit);

    //搜素房子
    //一个参数时，可以不写@Param,两个或以上时，一定要写@Param
    //在这里因为sql参数相对复杂，最后写在xml，HouseMapper.xml
    public List<House> searchHouse(@Param("houseSearchVO")HouseSearchVO houseSearchVO,@Param("page") Page page);
}