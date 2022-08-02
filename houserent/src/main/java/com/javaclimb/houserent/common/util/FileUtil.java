package com.javaclimb.houserent.common.util;

import com.javaclimb.houserent.common.constant.Constant;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

//文件上传工具类
public class FileUtil {
    //文件上传
    public static Map<String,String> upload(MultipartFile file) throws Exception {
        Map<String,String> resultMap = new HashMap<>();
        File mediaPath = new File(Constant.UPLOADS_PATH);//获取常量Constant类中设置的文件上传路径
        if(!mediaPath.exists()) {
            if(!mediaPath.mkdirs()){
                throw new Exception("文件上传失败，无法创建文件夹");
            }
        }
        //原始文件名
        String originFileName = file.getOriginalFilename();
        //文件后缀，即图片格式
        String fileSuffix = originFileName.substring(originFileName.lastIndexOf(".")+1);
        //新文件名,不带后缀
        String nameWithoutSuffix = UUID.randomUUID().toString().replaceAll("-","");
        //重新生成新的文件名，带后缀
        String newFileName = nameWithoutSuffix + "." + fileSuffix;
        //上传
//        File descFile = new File(mediaPath.getAbsolutePath(),newFileName);
        File descFile = new File(mediaPath.getAbsoluteFile(),newFileName);
        file.transferTo(descFile);
        //映射到数据库中的保存路径
        String filePath = Constant.UPLOADS_ABSOLUTE_PATH+newFileName;
        resultMap.put("fileName",originFileName);
      //  resultMap.put("fileName ",originFileName);
        resultMap.put("filePath",filePath); //这里出现了一个怎么Debug都没de出来的问题，在引用变量名设置的filePath、fileName、fileSuffix均出现传值到Controller中值正常，但取值时都为NULL的情况，最后花费了好长时间在偶然查到一篇博客，看他说变量有空格时，自己再检查发现自己在fileUtil中变量名书写时也有空格，导致Controller中不带空格时取值不到，但上传时功能却仍然正常，，。
        resultMap.put("fileSuffix",fileSuffix);
        System.out.println(resultMap);
        return resultMap;
    }
}
