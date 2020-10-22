/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
public class CartObj implements Serializable {
    final static Logger logger = Logger.getLogger(CartObj.class.getName());
    private String customerID;
    private Map<Integer, Integer> items;
    private double totalMoney;

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
    
    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public Map<Integer, Integer> getItems() {
        return items;
    }
    
    public void addItemToCart(int productID) {
        logger.info("Add item to cart.");
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        int quantity = 1;
        if (this.items.containsKey(productID)) {
            quantity = this.items.get(productID) + 1;
        }
        this.items.put(productID, quantity);
    }

    public void removeItemFromCart(int id) {
        logger.info("Remove item to cart.");
        if (this.items == null) {
            return;
        }
        if (this.items.containsKey(id)) {
            this.items.remove(id);
            if (this.items.isEmpty()) {
                this.items = null;
            }
        }
    }

}
