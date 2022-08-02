package com.javaclimb.houserent.common.enums;

/*用户角色枚举*/

public enum UserRoleEnums {
    /*管理员*/
    ADMIN("admin"),

    //房东
    OWNER("owner"),

    //租客
    CUSTOMER("customer")
    ;

    private String value;

    UserRoleEnums(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
