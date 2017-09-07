package com.jxmy.pojo;

public class Jxmy_login {
    private Integer loginId;

    private String loginName;

    private String loginPassword;

    private Integer empId;

    private String empPhotourl;

    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword == null ? null : loginPassword.trim();
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpPhotourl() {
        return empPhotourl;
    }

    public void setEmpPhotourl(String empPhotourl) {
        this.empPhotourl = empPhotourl == null ? null : empPhotourl.trim();
    }
}