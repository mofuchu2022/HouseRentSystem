package com.javaclimb.houserent.common.util;

//发送邮件工具类

import io.github.biezhi.ome.OhMyEmail;

import javax.mail.MessagingException;
import java.util.Properties;

public class MailUtil {

    //邮件服务器
    private static String host = "smtp.qq.com";
    //发送邮件的账号,用户在输入信息后由该邮箱账号通过qq邮箱的授权码登录发送信息给数据库中的邮箱号
    private static String username = "2861343528@qq.com";
    //发送邮件的密码
    private static String pwd = "bxdmnwgkivndddha";
    //发送者姓名
    private static String fromname = "网友张某";

    //配置邮件
    public static void configMail(String stmpHost,String userName,String password) {
        Properties properties = OhMyEmail.defaultConfig(false);
        properties.setProperty("mail.smtp.host",stmpHost);
        OhMyEmail.config(properties,userName,password);
    }

    //发送邮件
    //to 接受者 title 标题 content 内容
    public static void sendEmail(String to,String title,String content) throws MessagingException {
        configMail(host,username,pwd);
        OhMyEmail.subject(title).from(fromname).to(to).html(content).send();
    }

    public static void main(String[] args) throws MessagingException {
        sendEmail(username,"hello!","world!");
    }
}
