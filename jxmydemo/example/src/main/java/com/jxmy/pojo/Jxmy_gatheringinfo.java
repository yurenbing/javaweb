package com.jxmy.pojo;

import java.util.Date;

public class Jxmy_gatheringinfo {
    private Integer gatheringId;

    private String projetName;

    private String projectInfo;

    private String payUnit;

    private Float totalMoney;

    private Date gatherDate;

    private String gatherNote;

    public Integer getGatheringId() {
        return gatheringId;
    }

    public void setGatheringId(Integer gatheringId) {
        this.gatheringId = gatheringId;
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

    public String getPayUnit() {
        return payUnit;
    }

    public void setPayUnit(String payUnit) {
        this.payUnit = payUnit == null ? null : payUnit.trim();
    }

    public Float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getGatherDate() {
        return gatherDate;
    }

    public void setGatherDate(Date gatherDate) {
        this.gatherDate = gatherDate;
    }

    public String getGatherNote() {
        return gatherNote;
    }

    public void setGatherNote(String gatherNote) {
        this.gatherNote = gatherNote == null ? null : gatherNote.trim();
    }
}