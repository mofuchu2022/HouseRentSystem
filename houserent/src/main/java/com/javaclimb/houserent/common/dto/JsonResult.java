package com.javaclimb.houserent.common.dto;

import lombok.Data;

/*前后端传输Json格式的数据*/
/*@Data 注解的主要作用是提高代码的简洁，使用这个注解可以省去代码中大量的get()、 set()、 toString()等方法；*/
@Data
public class JsonResult {
    /*返回的状态码 0失败 1成功*/
    private Integer code;
    /*返回的信息*/
    private String msg;
    /*返回的数据*/
    private Object result;

    /*返回数据的构造方法*/
    public JsonResult(Integer code, String msg, Object result) {
        this.code = code;
        this.msg = msg;
        this.result = result;
    }

    /*不返回数据的构造方法*/

    public JsonResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    /*返回状态码和数据的构造方法*/
    public JsonResult(Integer code, Object result) {
        this.code = code;
        this.result = result;
    }

    /*成功的返回，返回提示*/
    public static JsonResult success() {
        return new JsonResult(1,"操作成功");
    }

    /*成功的返回，返回信息*/
    public static JsonResult success(String msg) {
        return new JsonResult(1,msg);
    }

    /*成功的返回，返回对象*/
    public static JsonResult success(String msg,Object result) {
        return new JsonResult(1,msg,result);
    }

    /*错误的返回，返回信息*/
    public static JsonResult error(String msg) {
        return new JsonResult(0,msg);
    }

    /*错误的返回，返回对象*/
    public static JsonResult error(String msg,Object result) {
        return new JsonResult(0,msg,result);
    }
}
