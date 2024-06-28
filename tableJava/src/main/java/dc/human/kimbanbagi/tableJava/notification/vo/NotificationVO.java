package dc.human.kimbanbagi.tableJava.notification.vo;

import java.sql.Date;

public class NotificationVO {
    String uId;
    String rId;
    String rName;
    String rStatus;
    String rDate;
    String rTime;
    String aCount;
    String kCount;
    String wNumber;
    String hCount;
    String comments;
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

    public String getrStatus() {
        return rStatus;
    }

    public void setrStatus(String rStatus) {
        this.rStatus = rStatus;
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

    public String getwNumber() {
        return wNumber;
    }

    public void setwNumber(String wNumber) {
        this.wNumber = wNumber;
    }

    public String gethCount() {
        return hCount;
    }

    public void sethCount(String hCount) {
        this.hCount = hCount;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}
