package com.javaclimb.houserent.entity;

/*用户信息表*/

import com.baomidou.mybatisplus.annotation.TableName;
import com.javaclimb.houserent.common.base.BaseEntity;
import lombok.Data;


@Data
@TableName("t_user")
public class User extends BaseEntity {
    /*用户名，这里变量名称要遵循驼峰命名法，即首单词开头字母小写后，其余后续单词以大写进行开头*/
    private String userName;

    /*姓名*/
    private String userDisplayName;

    /*电话*/
    private String phone;

    /*邮箱*/
    private String email;

    /*用户密码*/
    private String userPass;

    /*身份证*/
    private String idCard;

    /*头像*/
    private String userAvatare;

    /*个人描述*/
    private String userDesc;

    /*账户状态 1正常 0禁用*/
    private Integer status;

    /*角色*/
    private String role;

    /*性别*/
    private String sex;

    /*爱好*/
    private String hobby;

    /*职业*/
    private String job;

}
