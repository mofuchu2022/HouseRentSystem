package com.javaclimb.houserent.common.enums;

/*用户状态枚举*/

public enum HouseStatusEnums {
    //未租出
    NOT_RENT(0),

    //已租出
    HAS_RENT(1),

    //已下架
    HAS_DOWN(-1),

    //待审核
    NOT_CHECK(-2),

    //审核不通过
    CHECK_REJECT(-3)

    ;

    private Integer value;

    HouseStatusEnums(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
