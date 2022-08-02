package com.javaclimb.houserent.common.util;

/*分页工具类*/


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang3.StringUtils;

public class PageUtil {
    /*按创建时间排序*/
    public static Page initMpPage(long pageNumber,long pageSize) {
        return initMpPage(pageNumber,pageSize,"createTime","desc");//按创建时间倒序排列
    }

    //MuBatis分页封装
    /*pageNumber 页码，第几页
     * pageSize 页大小
     * sort 排序字段
     * order 倒序、升序*/
    public static Page initMpPage(long pageNumber, long pageSize, String sort, String order) {
        if (StringUtils.isNotEmpty(sort)) {
            sort = cameToUnderline(sort);
        }
        if (pageNumber<1) {     //防止用户在第一页仍然点击上一页
            pageNumber = 1;
        }
        if (pageSize < 1) {
            pageSize = 6;
        }
        if (pageSize >100) {
            pageSize = 100;
        }
        //升序或者倒序排序房子
        Boolean isAsc = false;
        if (StringUtils.isEmpty(sort)||"asc".equals(order.toLowerCase())) {
            isAsc = true;
        }
        Page p = new Page(pageNumber,pageSize);
        if(isAsc){
            p.setAsc(sort);
        }else {
            p.setDesc(sort);
        }
        return p;
    }

    //将数据库中的表字段：驼峰转下划线
    private static String cameToUnderline(String str) {
        if (str == null || str.trim().isEmpty()) {
            return "";
        }
        int len = str.length();
        StringBuilder sb = new StringBuilder(len);
        sb.append(str.substring(0,1).toLowerCase());//先将字段的第一个字符转为小写的
        for (int i = 1; i < len; i++) {     //从第二个字符开始转换
            char c = str.charAt(i);
            if (Character.isUpperCase(c)) {     //如果后面字母有大写的，则添加一个"_",然后再连接字符
                sb.append("_");
                sb.append(Character.toLowerCase(c));
            }else {
                sb.append(c);   //否则直接连接字符
            }
        }
        return sb.toString();
    }
}
