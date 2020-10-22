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
public class UserDTO implements Serializable{
    private String userId;
    private String userName;
    private String email;
    private String password;
    private String role;
    private String address;
    private int phoneNumber;
    private String status;
    public UserDTO() {
    }

    public UserDTO(String userId, String userName, String email, String password, String role, String address, int phoneNumber) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public UserDTO(String userName, String email, String password, String role, String address, int phoneNumber, String status) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.status = status;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
