package com.jxmy.pojo;

import java.util.Date;

public class Jxmy_paymentinfo {
    private Integer paymentId;

    private String projetName;

    private String projectInfo;

    private String gatherUnit;

    private Float totalMoney;

    private Date paymentDate;

    private String paymentNote;

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public String getProjetName() {
        return projetName;
    }

    public void setProjetName(String projetName) {
        this.projetName = projetName == null ? null : projetName.trim();
    }

    public String getProjectInfo() {
        return projectInfo;
    }

    public void setProjectInfo(String projectInfo) {
        this.projectInfo = projectInfo == null ? null : projectInfo.trim();
    }

    public String getGatherUnit() {
        return gatherUnit;
    }

    public void setGatherUnit(String gatherUnit) {
        this.gatherUnit = gatherUnit == null ? null : gatherUnit.trim();
    }

    public Float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentNote() {
        return paymentNote;
    }

    public void setPaymentNote(String paymentNote) {
        this.paymentNote = paymentNote == null ? null : paymentNote.trim();
    }
}