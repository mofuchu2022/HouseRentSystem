package com.javaclimb.houserent.controller.backend;

//import com.javaclimb.houserent.common.base.BaseController;
//import com.javaclimb.houserent.common.constant.Constant;
//import com.javaclimb.houserent.common.dto.JsonResult;
//import com.javaclimb.houserent.common.util.FileUtil;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//
//import javax.servlet.http.HttpSession;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
////文件上传控制类
//@Controller
//@RequestMapping("/file")
//public class FileController extends BaseController {
//    /*文件上传*/
//    @RequestMapping(value = "/upload",method = RequestMethod.POST)
//    @ResponseBody
//    public JsonResult upload(@RequestParam("file")MultipartFile file, @RequestParam("key")String key, HttpSession session) {
//       //key用于区分同一时间多个用户主人上传图片的区别
//        Map<String,String> map = new HashMap<>();
//        try{
//            map = FileUtil.upload(file);//这里能够获取到传来的file的值，并将其赋值给map
//            System.out.println("这是上传图片保存信息的值 ： "+map);
//        }catch (Exception e) {
//            e.printStackTrace();
//            return JsonResult.error("上传失败");
//        }
//  //      String filePath = map.get("filePath");
//        String filePath = map.get("filePath");//但是这里通过map获取不到map中的值，全部都是，视频里应该能获取到不知道为什么，这个问题导致路径保存到数据库Null
//        System.out.println("这是图片的保存路径 ： "+filePath);
//
//        //将图片存在Session中
//        String sessionKey = Constant.SESSION_IMG_PREFIX + key;
//        List<String> imgList = (List<String>) session.getAttribute(sessionKey);
//        if (imgList == null) {
//            imgList = new ArrayList<>();
//        }
//        imgList.add(filePath);
//        session.setAttribute(sessionKey,imgList);
//        return JsonResult.success("上传成功！");
//    }
//
//}
//
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  文件上传控制器
 */
@Controller
@RequestMapping("/file")
public class FileController extends BaseController {
    /**
     *  文件上传
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult upload(@RequestParam("file")MultipartFile file, @RequestParam("key")String key, HttpSession session){
        Map<String, String> map = new HashMap<>();
        try {
            map = FileUtil.upload(file);
            System.out.println(map);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("上传失败");
        }
        String filePath = map.get("filePath");
        System.out.println("filepath: " +filePath);
        //将图片 URL 存在 session 中
        String sessionKey = Constant.SESSION_IMG_PREFIX + key;

        List<String> imgList = (List<String>) session.getAttribute(sessionKey);
        if(imgList == null){ //判断当前用户是否已经传过图片
            imgList = new ArrayList<>();
        }
        imgList.add(filePath);
        session.setAttribute(sessionKey, imgList);
        return JsonResult.success("上传成功");
    }

}