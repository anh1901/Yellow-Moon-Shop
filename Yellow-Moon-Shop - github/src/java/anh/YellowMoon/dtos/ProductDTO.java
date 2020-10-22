/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.dtos;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class ProductDTO implements Serializable{
    private int productId;
    private String name;
    private double price;
    private String date;
    private String photo;
    private String description;
    private int quantity;
    private int categoryID;
    private String dateExpire;
    private String status;

    public ProductDTO() {
    }

    public ProductDTO(int productId, String name, double price, String date, String description, int quantity, int categoryID, String dateExpire, String status,String photo) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.date = date;
        this.description = description;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.dateExpire = dateExpire;
        this.status = status;
        this.photo=photo;
    }
    
    public ProductDTO(int productId, String name, double price, String date, String photo, String description, int quantity, int categoryID, String dateExpire) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.date = date;
        this.photo = photo;
        this.description = description;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.dateExpire = dateExpire;
    }

    public ProductDTO(String name, double price, String date, String photo, String description, int quantity, int categoryID, String dateExpire) {
        this.name = name;
        this.price = price;
        this.date = date;
        this.photo = photo;
        this.description = description;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.dateExpire = dateExpire;
    }

    public ProductDTO(int productId, String name, double price, String date, String photo, String description, int quantity, int categoryID, String dateExpire, String status) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.date = date;
        this.photo = photo;
        this.description = description;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.dateExpire = dateExpire;
        this.status = status;
    }
    
    public String getDateExpire() {
        return dateExpire;
    }

    public void setDateExpire(String dateExpire) {
        this.dateExpire = dateExpire;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    
    
}
