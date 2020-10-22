/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.daos;

import anh.YellowMoon.dtos.OrderDTO;
import anh.YellowMoon.dtos.OrderDetailDTO;
import anh.YellowMoon.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
public class OrderDAO {
    final static Logger logger = Logger.getLogger(OrderDAO.class.getName());
    Connection c = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public boolean createOrder(OrderDTO orderDTO) throws SQLException, NamingException{
        logger.info("Create order.");
        try{
            c=DBUtils.makeConnection();
            if(c!=null){
                String sql="Insert into [order] (totalPrice, date, phone, address, userID, email, subtotal, ship, tax) values(?,?,?,?,?,?,?,?,?)";
                ps=c.prepareStatement(sql);
                ps.setDouble(1, orderDTO.getTotal());
                ps.setString(2, orderDTO.getDateOrder());
                ps.setInt(3, orderDTO.getPhoneNumber());
                ps.setString(4, orderDTO.getAddress());
                ps.setString(5, orderDTO.getCustomerID());
                ps.setString(6, orderDTO.getEmail());
                ps.setDouble(7, orderDTO.getSubtotal());
                ps.setDouble(8, orderDTO.getShipping());
                ps.setDouble(9, orderDTO.getTax());
                if(ps.executeUpdate()>0){
                    return true;
                }
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return false;
    }
    public boolean createOrderDetail(OrderDetailDTO orderDetailDTO) throws SQLException, NamingException{
        logger.info("Create order details.");
        try{
            c=DBUtils.makeConnection();
            if(c!=null){
                String sql="Insert into orderDetail (orderID, productID, quantity, price) values(?,?,?,?)";
                ps=c.prepareStatement(sql);
                ps.setInt(1, orderDetailDTO.getOrderID());
                ps.setInt(2, orderDetailDTO.getProductID());
                ps.setInt(3, orderDetailDTO.getQuantity());
                ps.setDouble(4, orderDetailDTO.getPrice());
                if(ps.executeUpdate()>0){
                    return true;
                }
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return false;
    }
    public int getOrderIDByDateTime(String datetime) throws NamingException, SQLException{
        logger.info("Get order details by datetime.");
        try{
            c=DBUtils.makeConnection();
            if(c!=null){
                String sql="select orderID from [order] where date = ?";
                ps=c.prepareStatement(sql);
                ps.setString(1, datetime);
                rs=ps.executeQuery();
                if(rs.next()){
                    return rs.getInt(1);
                }
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return 0;
    }
    public ArrayList<OrderDTO> getOrderByUserID(String userID) throws NamingException, SQLException{
        logger.info("Get order by user ID.");
        ArrayList<OrderDTO> orders=new ArrayList<>();
        try{
            c=DBUtils.makeConnection();
            if(c!= null){
                String sql="select orderID, totalPrice, date, phone, address, userID, email, subtotal, ship, tax from [order] where userID=? order by date DESC";
                ps=c.prepareStatement(sql);
                ps.setString(1, userID);
                rs=ps.executeQuery();
                while(rs.next()){
                    OrderDTO orderDTO=new OrderDTO(rs.getInt(1),rs.getString(6), rs.getString(5), rs.getInt(4), rs.getString(7), rs.getString(3), rs.getDouble(8), rs.getDouble(8), rs.getDouble(9), rs.getDouble(2));
                    orders.add(orderDTO);
                }
                return orders;
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return orders;
    }
    public OrderDTO searchOrderOfUser(String userID,int searchID) throws NamingException, SQLException{
        logger.info("Search orders by user.");
        OrderDTO orderDTO=null;
        try{
            c=DBUtils.makeConnection();
            if(c!= null){
                String sql="select orderID, totalPrice, date, phone, address, userID, email, subtotal, ship, tax from [order] where userID=? and orderID=? order by date DESC";
                ps=c.prepareStatement(sql);
                ps.setString(1, userID);
                ps.setInt(2, searchID);
                rs=ps.executeQuery();
                if(rs.next()){
                    orderDTO=new OrderDTO(rs.getInt(1),rs.getString(6), rs.getString(5), rs.getInt(4), rs.getString(7), rs.getString(3), rs.getDouble(8), rs.getDouble(8), rs.getDouble(9), rs.getDouble(2));
                }
                return orderDTO;
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return orderDTO;
    }
    public OrderDTO searchOrdersAdmin(int searchID) throws NamingException, SQLException{
        logger.info("Search order by Admin.");
        OrderDTO orderDTO=null;
        try{
            c=DBUtils.makeConnection();
            if(c!= null){
                String sql="select orderID, totalPrice, date, phone, address, userID, email, subtotal, ship, tax from [order] where orderID=? order by date DESC";
                ps=c.prepareStatement(sql);
                ps.setInt(1, searchID);
                rs=ps.executeQuery();
                if(rs.next()){
                    orderDTO=new OrderDTO(rs.getInt(1),rs.getString(6), rs.getString(5), rs.getInt(4), rs.getString(7), rs.getString(3), rs.getDouble(8), rs.getDouble(8), rs.getDouble(9), rs.getDouble(2));
                }
                return orderDTO;
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return orderDTO;
    }
    public ArrayList<OrderDetailDTO> getOrderDetails() throws NamingException, SQLException{
        logger.info("Get order details.");
        ArrayList<OrderDetailDTO> orderDetails=new ArrayList<>();
        try{
            c=DBUtils.makeConnection();
            if(c!= null){
                String sql="select detailID, orderID, productID, quantity, price from orderDetail";
                ps=c.prepareStatement(sql);
                rs=ps.executeQuery();
                while(rs.next()){
                    OrderDetailDTO orderDetailDTO=new OrderDetailDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(5)*1.0, rs.getInt(4));
                    orderDetails.add(orderDetailDTO);
                }
                return orderDetails;
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return orderDetails;
    }
    public ArrayList<OrderDTO> getOrders() throws NamingException, SQLException{
        logger.info("Get all orders.");
        ArrayList<OrderDTO> orders=new ArrayList<>();
        try{
            c=DBUtils.makeConnection();
            if(c!= null){
                String sql="select orderID, totalPrice, date, phone, address, userID, email, subtotal, ship, tax from [order]";
                ps=c.prepareStatement(sql);
                rs=ps.executeQuery();
                while(rs.next()){
                    OrderDTO orderDTO=new OrderDTO(rs.getInt(1),rs.getString(6), rs.getString(5), rs.getInt(4), rs.getString(7), rs.getString(3), rs.getDouble(8), rs.getDouble(8), rs.getDouble(9), rs.getDouble(2));
                    orders.add(orderDTO);
                }
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return orders;
    }
    public void closeConnection(Connection con, PreparedStatement ps, ResultSet rs) throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
        if (con != null && !con.isClosed()) {
            con.close();
        }
    }
}
