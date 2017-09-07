package com.jxmy.utils;

import org.springframework.web.multipart.MultipartFile;

public class UploadBean {
    private MultipartFile name;     //上传文件属性

    public void setName(MultipartFile name) {
        this.name = name;
    }

    public MultipartFile getName() {
        return name;
    }
}
