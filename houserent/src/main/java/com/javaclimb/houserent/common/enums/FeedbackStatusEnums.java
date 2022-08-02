package com.javaclimb.houserent.common.enums;


//反馈状态枚举
public enum FeedbackStatusEnums {
    //状态：0 未处理 1 已处理

    //未处理
    NOT_HANDLE(0),

    //已处理
    HAS_HANDLE(1)
    ;
    private Integer value;
    FeedbackStatusEnums(Integer value){this.value = value;}
    public Integer getValue() {return value;}
    public void setValue(Integer value) {this.value = value;}
}
