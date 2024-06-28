package dc.human.kimbanbagi.tableJava.wait.vo;

import java.sql.Date;

public class WaitVO {
    String uId;
    String uNumber;
    String rId;
    String rName;
    String hCount;
    String wNumber;
    String wStatus;
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

    public String getuNumber() {
        return uNumber;
    }

    public void setuNumber(String uNumber) {
        this.uNumber = uNumber;
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

    public String gethCount() {
        return hCount;
    }

    public void sethCount(String hCount) {
        this.hCount = hCount;
    }

    public String getwNumber() {
        return wNumber;
    }

    public void setwNumber(String wNumber) {
        this.wNumber = wNumber;
    }

    public String getwStatus() {
        return wStatus;
    }

    public void setwStatus(String wStatus) {
        this.wStatus = wStatus;
    }
}
