package com.javaclimb.houserent.controller.front;


import com.javaclimb.houserent.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//用户访问错误要跳向404页面

@Controller
public class ErrorController extends BaseController {
    //找不到资源
    @RequestMapping(value = "/404",method = RequestMethod.GET)
    public String to404() {
        return "common/404";
    }

    //没有权限进行访问
    @RequestMapping(value = "/403",method = RequestMethod.GET)
    public String to403() {
        return "common/403";
    }

    //服务器内部错误
    @RequestMapping(value = "/500",method = RequestMethod.GET)
    public String to500() {
        return "common/500";
    }

    //其他错误系统异常，可以通过java语法获取错误码判断是不是403,404,500这几种错误，如果是的话就自动转发到其错误对应页面
    @RequestMapping(value = "/error",method = RequestMethod.GET)
    public String error() {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if (statusCode.equals("404")) {
            return "redirect:/404";
        }else if (statusCode.equals("500")){
            return "redirect:/500";
        }
        return "common/error";
    }

}
