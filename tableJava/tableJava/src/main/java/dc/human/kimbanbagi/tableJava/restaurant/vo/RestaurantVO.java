package dc.human.kimbanbagi.tableJava.restaurant.vo;

import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

public class RestaurantVO {
    String rId;
    String rName;
    String rHead;
    String rCity;
    String rAddress;
    String rNumber;
    String uId;
    String rStatus;
    String wStatus;
    Date createdDate;
    Date updatedDate;
    MultipartFile rPhoto;
    String fileName;
    String revCount;

    public String getRevCount() {
        return revCount;
    }

    public void setRevCount(String revCount) {
        this.revCount = revCount;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public MultipartFile getrPhoto() {
        return rPhoto;
    }

    public void setrPhoto(MultipartFile rPhoto) {
        this.rPhoto = rPhoto;
    }

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

    public String getrHead() {
        return rHead;
    }

    public void setrHead(String rHead) {
        this.rHead = rHead;
    }

    public String getrCity() {
        return rCity;
    }

    public void setrCity(String rCity) {
        this.rCity = rCity;
    }

    public String getrAddress() {
        return rAddress;
    }

    public void setrAddress(String rAddress) {
        this.rAddress = rAddress;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getrNumber() {
        return rNumber;
    }

    public void setrNumber(String rNumber) {
        this.rNumber = rNumber;
    }

    public String getrStatus() {
        return rStatus;
    }

    public void setrStatus(String rStatus) {
        this.rStatus = rStatus;
    }

    public String getwStatus() {
        return wStatus;
    }

    public void setwStatus(String wStatus) {
        this.wStatus = wStatus;
    }


}
