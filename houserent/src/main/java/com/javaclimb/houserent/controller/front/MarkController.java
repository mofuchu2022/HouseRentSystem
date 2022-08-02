package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.entity.Mark;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

//收藏控制器

@Controller
public class MarkController extends BaseController {
    @Autowired
    private MarkService markService;
    //收藏提交
    @RequestMapping(value = "/mark/submit",method =  RequestMethod.POST)
    @ResponseBody
    public JsonResult submit(@RequestParam("houseId")Long houseId) {
        //先判断用户是否已经登录成功
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return JsonResult.error("您当前尚未登录！");
        }
        //判断用户是否已经收藏过当前的房子
        List<Mark> markList = markService.findByUserIdAndHouseId(loginUser.getId(),houseId);
        if (markList!= null && markList.size()>0) {
            return JsonResult.error("您已经收藏过了，不能再次进行收藏！");
        }
        Mark mark = new Mark();
        mark.setCreateTime(new Date());
        mark.setUserId(loginUser.getId());
        mark.setHouseId(houseId);   //mark.setHouseId(loginUser.getId());这里因为在跟着写的时候疏漏与上一句写重复导致设置房子Id一直都为管理员用户的Id，这样除了与管理员用户相同的id之外，其他的房子无论点击收藏几次都不会将房子id添加进去导致重复添加校验功能失效，而我在debug的时候考虑的是可能是值传错所以一直陷入思维误区markList的findByUserIdAndHouseId方法返回的一直都是false所以怎么校验都没在检验功能前面发现错误，总而言之这个错误是因为插入值重复导致的
        markService.insert(mark);
        return JsonResult.success("收藏成功！");
    }
}
