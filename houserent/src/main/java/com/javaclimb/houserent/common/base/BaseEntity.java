package com.javaclimb.houserent.common.base;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/*所有类都含有的属性，这里对两个属性进行抽离*/

@Data
public class BaseEntity implements Serializable {
    /*Id,主键，自动生成*/
    @TableId(type= IdType.AUTO)
    private Long id;

    /*创建时间*/
    @JsonFormat(pattern = "pattern = yyyy-mm-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;
}
