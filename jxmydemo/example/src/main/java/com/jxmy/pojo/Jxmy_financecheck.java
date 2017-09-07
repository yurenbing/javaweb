package com.jxmy.pojo;

import java.util.Date;

public class Jxmy_financecheck {
    private Integer checkId;

    private String empOwner;

    private String empDep;

    private String projetName;

    private String projectInfo;

    private Double projectMoney;

    private Date projectDate;

    private String empCheck;

    private String checkInfo;

    private Date checkDate;

    private String financeNote;

    private String finance1;

    private String finance2;

    private String finance3;

    public Integer getCheckId() {
        return checkId;
    }

    public void setCheckId(Integer checkId) {
        this.checkId = checkId;
    }

    public String getEmpOwner() {
        return empOwner;
    }

    public void setEmpOwner(String empOwner) {
        this.empOwner = empOwner == null ? null : empOwner.trim();
    }

    public String getEmpDep() {
        return empDep;
    }

    public void setEmpDep(String empDep) {
        this.empDep = empDep == null ? null : empDep.trim();
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

    public Double getProjectMoney() {
        return projectMoney;
    }

    public void setProjectMoney(Double projectMoney) {
        this.projectMoney = projectMoney;
    }

    public Date getProjectDate() {
        return projectDate;
    }

    public void setProjectDate(Date projectDate) {
        this.projectDate = projectDate;
    }

    public String getEmpCheck() {
        return empCheck;
    }

    public void setEmpCheck(String empCheck) {
        this.empCheck = empCheck == null ? null : empCheck.trim();
    }

    public String getCheckInfo() {
        return checkInfo;
    }

    public void setCheckInfo(String checkInfo) {
        this.checkInfo = checkInfo == null ? null : checkInfo.trim();
    }

    public Date getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }

    public String getFinanceNote() {
        return financeNote;
    }

    public void setFinanceNote(String financeNote) {
        this.financeNote = financeNote == null ? null : financeNote.trim();
    }

    public String getFinance1() {
        return finance1;
    }

    public void setFinance1(String finance1) {
        this.finance1 = finance1 == null ? null : finance1.trim();
    }

    public String getFinance2() {
        return finance2;
    }

    public void setFinance2(String finance2) {
        this.finance2 = finance2 == null ? null : finance2.trim();
    }

    public String getFinance3() {
        return finance3;
    }

    public void setFinance3(String finance3) {
        this.finance3 = finance3 == null ? null : finance3.trim();
    }
}