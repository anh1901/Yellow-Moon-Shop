/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.dtos;

/**
 *
 * @author DELL
 */
public class LogDTO {
    private int logID;
    private int userID;
    private int productID;
    private String updateDate;

    public LogDTO(int userID, int productID, String updateDate) {
        this.userID = userID;
        this.productID = productID;
        this.updateDate = updateDate;
    }

    public LogDTO(int logID, int userID, int productID, String updateDate) {
        this.logID = logID;
        this.userID = userID;
        this.productID = productID;
        this.updateDate = updateDate;
    }
    
    public int getLogID() {
        return logID;
    }

    public void setLogID(int logID) {
        this.logID = logID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }
    
}
