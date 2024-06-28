package dc.human.kimbanbagi.tableJava.book.vo;

import java.sql.Date;

public class BookVO {
    String uId;
    String rId;
    String rName;
    String rDate;
    String rTime;
    String rStatus;
    String aCount;
    String kCount;
    String sCount;
    String wCount;
    String requirements;
    String uName;
    Date createdDate;
    Date updatedDate;

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getrId() {
        return rId;
    }

    public void setrId(String rId) {
        this.rId = rId;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getrDate() {
        return rDate;
    }

    public void setrDate(String rDate) {
        this.rDate = rDate;
    }

    public String getrTime() {
        return rTime;
    }

    public void setrTime(String rTime) {
        this.rTime = rTime;
    }

    public String getrStatus() {
        return rStatus;
    }

    public void setrStatus(String rStatus) {
        this.rStatus = rStatus;
    }

    public String getaCount() {
        return aCount;
    }

    public void setaCount(String aCount) {
        this.aCount = aCount;
    }

    public String getkCount() {
        return kCount;
    }

    public void setkCount(String kCount) {
        this.kCount = kCount;
    }

    public String getsCount() {
        return sCount;
    }

    public void setsCount(String sCount) {
        this.sCount = sCount;
    }

    public String getwCount() {
        return wCount;
    }

    public void setwCount(String wCount) {
        this.wCount = wCount;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }
}
