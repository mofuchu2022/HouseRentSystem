package com.javaclimb.houserent.controller.backend;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.HouseStatusEnums;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Objects;


/*房子控制管理器*/
@Controller("backendHouseController")
@RequestMapping("/admin/house")
public class HouseController extends BaseController {
    @Autowired
    private HouseService houseService;  //这里漏写了@Autowired注解，导致前台数据传送到发布房子提交方法后，无法添加到数据库直接返回错误，这个注解的作用是自动装配houseService不用手动new该对象

   /*进入后台房子的管理页面*/
//    @RequestMapping("")
//    public String houseList() {
//        return "admin/house-list";
//    }
   /*进入后台房子的管理页面,这里因为有两个同名houseList方法导致前端默认访问了第一个方法，查不出来数据也不返回错误*/
    @RequestMapping("")
    public String houseList(@RequestParam(value = "page",defaultValue = "1")Long pageNumber,@RequestParam(value = "size",defaultValue = "6")Long pageSize,Model model) {
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        House condition = new House();
        //如果用户是管理员，就可以查询所有的房子，否则只能查询自己所发布的房子
        if(!loginUserIsAdmin()) {   //查询用户不是管理员
            condition.setUserId(getLoginUserId());
        }
        Page<House> housePage = houseService.findAll(page,condition);
        model.addAttribute("pageInfo",housePage);   //页码
        model.addAttribute("pagePrefix","/admin/house?");   //房子访问路径
        model.addAttribute("isAdmin",loginUserIsAdmin());   //用户身份
        model.addAttribute("tab","house-list");
        return "admin/house-list";
    }

    /*进入后台房子的发布页面*/
    @RequestMapping("/publish")
    public String publish(@RequestParam(value = "id",required = false)Long id,Model model) {
        House house = new House();
        //编辑页面
        if(id!=null) {
            house = houseService.get(id);
            if (house == null) {
                return renderNotFound();//这个返回的是404页面
            }
            //如果不是管理员，又要编辑不是自己的房子则跳转到无权限页面403
            if(!loginUserIsAdmin() && !Objects.equals(house.getUserId(),getLoginUserId())) {
                return renderNotAllowAccess();//这个则返回的是403页面
            }
        }
        model.addAttribute("house",house);
        return "admin/house-publish";
    }

    //发布房子信息
    @RequestMapping("/publish/submit")
    @ResponseBody
    public JsonResult publishSubmit(House house,@RequestParam("key")String key, HttpSession session) {
    //这里的参数key为FileUtil中的session key
        try {
            if(house.getId() == null) { //编辑的时候id不为空，设置时间和房屋主人也不为空，则不用重新进行设置，这里表示房子id为空则进行设置
                house.setCreateTime(new Date());
                house.setUserId(getLoginUserId());
            }else{
                House queryHouse = houseService.get(house.getId());
                if (queryHouse == null) {
                    return JsonResult.error("编辑失败，该id房子尚未创建！");
                }
                if(!loginUserIsAdmin() && !Objects.equals(house.getUserId(),getLoginUserId())) {
                    return JsonResult.error("编辑失败，你不能编辑其他人的房子！");//这个则返回的是403页面
                }
            }
            house.setStatus(HouseStatusEnums.NOT_CHECK.getValue());
            //获取轮播图
            String sessionKey = Constant.SESSION_IMG_PREFIX + key;
            List<String> imgList = (List<String>)session.getAttribute(sessionKey);
            if (imgList!=null&&imgList.size()>0) {  //如果用户上传了图片，那么imgList的size就必然大于0
                //把轮播图转换成json格式进行存储
                house.setSlideUrl(JSON.toJSONString(imgList));
                //把轮播图的第一个图放到缩略图
                house.setThumbnailUrl(imgList.get(0));

            }
            houseService.insertOrUpdate(house);
//            System.out.println(house);
        }catch (Exception e) {
            return JsonResult.error("发布失败，请填写完整信息");
        }
        return JsonResult.success("发布成功",house.getId());
    }

    //下架房子
    @RequestMapping("/down")
    @ResponseBody
    public JsonResult downHouse(@RequestParam("id")Long id) {
        //下架房子即通过id修改房子的状态码
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("没有这个房子，不能进行下架！");
            }
            if(!loginUserIsAdmin() && !Objects.equals(house.getUserId(),getLoginUserId())) {
                    return JsonResult.error("下架失败，你不能下架其他人的房子！");//这个则返回的是403页面
            }
            //这个用的就是Objects的equals方法，在方法里根据两个函数返回的值进行比较，如果相同则执行语句，否则不执行
            if (Objects.equals(house.getStatus(),HouseStatusEnums.HAS_RENT.getValue())) {
                return JsonResult.error("房子已经租出，不能进行下架！");
            }
            house.setStatus(HouseStatusEnums.HAS_DOWN.getValue());
            houseService.update(house);
        }catch (Exception e) {
            return JsonResult.error("下架房子失败");
        }
        return JsonResult.success("下架成功");
    }

    //审核房子通过
    @RequestMapping("/auditPass")
    @ResponseBody
    public JsonResult auditPass(@RequestParam("id")Long id) {
        //上架房子即通过id修改房子的状态码
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("没有这个房子，不能进行审核！");
            }
            if(!loginUserIsAdmin()) {
                return JsonResult.error("你没有权限审核！");//这个则返回的是403页面
            }
            //这个用的就是Objects的equals方法，在方法里根据两个函数返回的值进行比较，如果相同则执行语句，否则不执行
            if (!Objects.equals(house.getStatus(),HouseStatusEnums.NOT_CHECK.getValue())) {
                return JsonResult.error("只能审核待审核的房子！");
            }
            house.setStatus(HouseStatusEnums.NOT_RENT.getValue());
            houseService.update(house);
        }catch (Exception e) {
            return JsonResult.error("审核房子通过失败");
        }
        return JsonResult.success("审核房子通过成功");
    }

    //审核房子不通过
    @RequestMapping("/auditNotPass")
    @ResponseBody
    public JsonResult auditNotPass(@RequestParam("id")Long id) {
        //上架房子即通过id修改房子的状态码
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("没有这个房子，不能进行审核！");
            }
            if(!loginUserIsAdmin()) {
                return JsonResult.error("你没有权限审核！");//这个则返回的是403页面
            }
            //这个用的就是Objects的equals方法，在方法里根据两个函数返回的值进行比较，如果相同则执行语句，否则不执行
            if (!Objects.equals(house.getStatus(),HouseStatusEnums.NOT_CHECK.getValue())) {
                return JsonResult.error("只能审核待审核的房子！");
            }
            house.setStatus(HouseStatusEnums.CHECK_REJECT.getValue());
            houseService.update(house);
        }catch (Exception e) {
            return JsonResult.error("审核不通过房子失败");
        }
        return JsonResult.success("审核不通过房子成功");
    }

    //删除房子
    @RequestMapping("/deleteHouse")
    @ResponseBody
    public JsonResult deleteHouse(@RequestParam("id")Long id) {
        //上架房子即通过id修改房子的状态码
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("没有这个房子，不能进行删除！");
            }
            if(!loginUserIsAdmin() && !Objects.equals(house.getUserId(),getLoginUserId())) {
                return JsonResult.error("这不是你的房子，你没有权限删除该房子！");//这个则返回的是403页面
            }
            if (Objects.equals(house.getStatus(),HouseStatusEnums.HAS_RENT.getValue())) {
                return JsonResult.error("房子已经租出，不能进行删除！");
            }
            houseService.delete(house.getId());
        }catch (Exception e) {
            return JsonResult.error("删除房子失败");
        }
        return JsonResult.success("删除房子成功");
    }

}
