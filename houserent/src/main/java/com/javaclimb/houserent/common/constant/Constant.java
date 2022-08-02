package com.javaclimb.houserent.common.constant;


/*常量类*/
public class Constant {
    /*用户Session的key*/
    public static final String SESSION_USE_KEY = "user";

    //相对路径,文件所在的目录名称
    public static final String UPLOADS_ABSOLUTE_PATH = "/uploads/";

    //上传目录,这里应该是设置为在IDEA工具的根目录并生成uploads文件夹,绝对路径，硬盘所在的目录，在我的电脑的路径为：C: Users zhanghui uploads，其中第三个可能为Administrator
    public static final String UPLOADS_PATH = System.getProperties().getProperty("user.home")+UPLOADS_ABSOLUTE_PATH;

    //图片session的前缀
    public static final String SESSION_IMG_PREFIX = "SESSION_IMG_";

    //最少租住天数
    public static final Integer MIN_RENT_DAYS = 7;

    //首页显示房子的数量
    public static final Integer INDEX_HOUSE_NUM = 3;

    //新闻显示摘要的最大字数
    public static final  Integer POST_SUMMARY_NUM = 300;
}
