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
public class OrderDTO implements Serializable{
    private int orderID;
    private String customerID;
    private String address;
    private int phoneNumber;
    private String email;
    private String dateOrder;
    private Double subtotal;
    private Double shipping;
    private Double tax;
    private Double total;

    public OrderDTO(String customerID, String address, int phoneNumber, String email, String dateOrder, Double subtotal, Double shipping, Double tax, Double total) {
        this.customerID = customerID;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.dateOrder = dateOrder;
        this.subtotal = subtotal;
        this.shipping = shipping;
        this.tax = tax;
        this.total = total;
    }

    public OrderDTO(int orderID, String customerID, String address, int phoneNumber, String email, String dateOrder, Double subtotal, Double shipping, Double tax, Double total) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.dateOrder = dateOrder;
        this.subtotal = subtotal;
        this.shipping = shipping;
        this.tax = tax;
        this.total = total;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }
    
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Double getShipping() {
        return shipping;
    }

    public void setShipping(Double shipping) {
        this.shipping = shipping;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
}
