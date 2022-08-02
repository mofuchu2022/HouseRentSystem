package com.javaclimb.houserent.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    public static void main(String[] args) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d1 = sdf.parse("2012-09-08 10:10:10");
        Date d2 = sdf.parse("2012-09-15 00:00:00");
        System.out.println(daysBetween(d1,d2));
    }

    //计算两个日期之间相差的天数
    public  static int daysBetween(Date smdate,Date bdate)  {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       try {
           smdate = sdf.parse(sdf.format(smdate));
           bdate = sdf.parse(sdf.format(bdate));
       }catch (ParseException e) {
           e.printStackTrace();
       }
        Calendar cal = Calendar.getInstance();
        cal.setTime(smdate);
        long time1 = cal.getTimeInMillis();
        cal.setTime(bdate);
        long time2  = cal.getTimeInMillis();
        long between_days = (time2 - time1) / (1000 * 3600 *24);
        return Integer.parseInt(String.valueOf(between_days));
    }
}
