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
public class OrderDetailDTO implements Serializable{
    private int detailID;
    private int orderID;
    private int productID;
    private Double price;
    private int quantity;

    public int getDetailID() {
        return detailID;
    }

    public OrderDetailDTO(int detailID, int orderID, int productID, Double price, int quantity) {
        this.detailID = detailID;
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }
    
    public OrderDetailDTO(int orderID, int productID, Double price, int quantity) {
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }
    
    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
