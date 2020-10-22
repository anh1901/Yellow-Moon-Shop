/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.daos;

import anh.YellowMoon.dtos.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import anh.YellowMoon.utils.DBUtils;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.naming.NamingException;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
public class ProductDAO {
    final static Logger logger = Logger.getLogger(ProductDAO.class.getName());
    Connection c = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private int numberOfProducts;

    public ArrayList<ProductDTO> getProductsByCategoryID(int categoryID, int offset, int limit) throws NamingException, SQLException {
        logger.info("Get products by category ID.");
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            c = DBUtils.makeConnection();
            if (c != null) {
                String sql = "Select name, price, categoryID, quantity, photo,description, date,dateExpire, productID from product where dateExpire >= ? and categoryID= ? and quantity>0 and status='active' order by date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                ps = c.prepareStatement(sql);
                ps.setInt(2, categoryID);
                ps.setInt(3, offset);
                ps.setInt(4, limit);
                ps.setString(1, ""+LocalDate.now());
                rs = ps.executeQuery();
                ProductDTO productDTO;
                while (rs.next()) {
                    productDTO = new ProductDTO(rs.getInt(9), rs.getString(1), rs.getDouble(2), rs.getString(7), rs.getString(5), rs.getString(6), rs.getInt(4), rs.getInt(3), rs.getString(8));
                    products.add(productDTO);
                }
                sql = "Select count(*) from product where categoryID=?";
                ps = c.prepareStatement(sql);
                ps.setInt(1, categoryID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    numberOfProducts = rs.getInt(1);
                }
            }
        } finally {
            closeConnection(c, ps, rs);
        }
        return products;
    }

    public ArrayList<ProductDTO> getProducts(int offset, int limit) throws NamingException, SQLException {
        logger.info("Get all products.");
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            c = DBUtils.makeConnection();
            if (c != null) {
                String sql = "Select name, price, categoryID, quantity, photo,description, date,dateExpire,productID from product where quantity>0 and status='active' and dateExpire >= ? order by date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                ps = c.prepareStatement(sql);
                ps.setInt(2, offset);
                ps.setInt(3, limit);
                ps.setString(1, ""+LocalDate.now());
                rs = ps.executeQuery();
                ProductDTO productDTO;
                while (rs.next()) {
                    productDTO = new ProductDTO(rs.getInt(9), rs.getString(1), rs.getDouble(2), rs.getString(7), rs.getString(5), rs.getString(6), rs.getInt(4), rs.getInt(3), rs.getString(8));
                    products.add(productDTO);
                }
                sql = "Select count(*) from product where quantity>0 and status='active' and dateExpire >= ?";
                ps = c.prepareStatement(sql);
                ps.setString(1, ""+LocalDate.now());
                rs = ps.executeQuery();
                if (rs.next()) {
                    numberOfProducts = rs.getInt(1);
                }
            }
        } finally {
            closeConnection(c, ps, rs);
        }
        return products;
    }

    public ProductDTO getProductByID(int id) throws NamingException, SQLException {
        logger.info("Get product by ID.");
        ProductDTO product = null;
        try {
            c = DBUtils.makeConnection();
            if (c != null) {
                String sql = "Select name, price, categoryID, quantity, photo,description, date,dateExpire,productID from product where quantity>0 and status='active' and productId=?";
                ps = c.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                if (rs.next()) {
                    product = new ProductDTO(rs.getInt(9), rs.getString(1), rs.getDouble(2), rs.getString(7), rs.getString(5), rs.getString(6), rs.getInt(4), rs.getInt(3), rs.getString(8));
                }
            }
        } finally {
            closeConnection(c, ps, rs);
        }
        return product;
    }

    public boolean addProduct(ProductDTO productDTO) throws NamingException, SQLException {
        logger.info("Add new product.");
        try {
            c = DBUtils.makeConnection();
            if (c != null) {
                String sql = "INSERT INTO dbo.Product(name,price,categoryID,photo,description,date,dateExpire,status,quantity) VALUES (?,?,?,?,?,?,?,?,?)";
                ps = c.prepareStatement(sql);
                ps.setString(1, productDTO.getName());
                ps.setDouble(2, productDTO.getPrice());
                ps.setInt(3, productDTO.getCategoryID());
                ps.setString(4, productDTO.getPhoto());
                ps.setString(5, productDTO.getDescription());
                ps.setString(6, productDTO.getDate());
                ps.setString(7, productDTO.getDateExpire());
                ps.setString(8, "active");
                ps.setInt(9, productDTO.getQuantity());
                if (ps.executeUpdate() > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection(c, ps, rs);
        }
        return false;
    }

    public boolean deleteProductByID(int id) throws NamingException, SQLException {
        logger.info("Change status to deleted.");
        try {
            c = DBUtils.makeConnection();
            if (c != null) {
                String sql = "Update product set status='Deleted' where productID=? ";
                ps = c.prepareStatement(sql);
                ps.setInt(1, id);
                if (ps.executeUpdate() > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection(c, ps, rs);
        }
        return false;
    }

    public ArrayList<ProductDTO> searchProductsAdvance(String searchName, Double priceMin, Double priceMax, String category, int offset, int limit) throws NamingException, SQLException {
        logger.info("Advance search product by user.");
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            c = DBUtils.makeConnection();
            if (c != null) {
                searchName = searchName.replace("!", "!!").replace("%", "!%").replace("_", "!_").replace("[", "![").replace("[^", "![^");
                String sql = "Select dbo.Product.name, price, categoryID, quantity, photo,description, date,dateExpire,productID, status from product JOIN dbo.Category ON Category.catagoryID = Product.categoryID WHERE(price between ? and ?) AND (dbo.Product.name LIKE ? ESCAPE '!') AND (dbo.Category.Name like ?) and(status='active')ORDER by date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                ps = c.prepareStatement(sql);
                ps.setDouble(1, priceMin);
                ps.setDouble(2, priceMax);
                ps.setString(3, "%" + searchName + "%");
                ps.setString(4, "%" + category + "%");
                ps.setInt(5, offset);
                ps.setInt(6, limit);
                rs = ps.executeQuery();
                ProductDTO productDTO;
                while (rs.next()) {
                    productDTO = new ProductDTO(rs.getInt(9), rs.getString(1), rs.getDouble(2), rs.getString(7), rs.getString(5), rs.getString(6), rs.getInt(4), rs.getInt(3), rs.getString(8), rs.getString(10));
                    products.add(productDTO);
                }
                sql = "  Select count(*) from product JOIN dbo.Category ON Category.catagoryID = Product.categoryID WHERE(price between ? and ?) AND (dbo.Product.name LIKE ? ESCAPE '!') AND (dbo.Category.Name like ?) and(status='active')";
                ps = c.prepareStatement(sql);
                ps.setDouble(1, priceMin);
                ps.setDouble(2, priceMax);
                ps.setString(3, "%" + searchName + "%");
                ps.setString(4, "%" + category + "%");
                rs = ps.executeQuery();
                if (rs.next()) {
                    numberOfProducts = rs.getInt(1);
                }
            }
        } finally {
            closeConnection(c, ps, rs);
        }
        return products;
    }
    public ArrayList<ProductDTO> searchProductsAdvanceByAdmin(String searchName, Double priceMin, Double priceMax, String category, int offset, int limit) throws NamingException, SQLException {
        logger.info("Advance search product by admin.");
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            c = DBUtils.makeConnection();
            if (c != null) {
                searchName = searchName.replace("!", "!!").replace("%", "!%").replace("_", "!_").replace("[", "![").replace("[^", "![^");
                String sql = "Select dbo.Product.name, price, categoryID, quantity, photo,description, date,dateExpire,productID, status from product JOIN dbo.Category ON Category.catagoryID = Product.categoryID WHERE(price between ? and ?) AND (dbo.Product.name LIKE ? ESCAPE '!') AND (dbo.Category.Name like ?) ORDER by date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                ps = c.prepareStatement(sql);
                ps.setDouble(1, priceMin);
                ps.setDouble(2, priceMax);
                ps.setString(3, "%" + searchName + "%");
                ps.setString(4, "%" + category + "%");
                ps.setInt(5, offset);
                ps.setInt(6, limit);
                rs = ps.executeQuery();
                ProductDTO productDTO;
                while (rs.next()) {
                    productDTO = new ProductDTO(rs.getInt(9), rs.getString(1), rs.getDouble(2), rs.getString(7), rs.getString(5), rs.getString(6), rs.getInt(4), rs.getInt(3), rs.getString(8), rs.getString(10));
                    products.add(productDTO);
                }
                sql = "  Select count(*) from product JOIN dbo.Category ON Category.catagoryID = Product.categoryID WHERE(price between ? and ?) AND (dbo.Product.name LIKE ? ESCAPE '!') AND (dbo.Category.Name like ?)";
                ps = c.prepareStatement(sql);
                ps.setDouble(1, priceMin);
                ps.setDouble(2, priceMax);
                ps.setString(3, "%" + searchName + "%");
                ps.setString(4, "%" + category + "%");
                rs = ps.executeQuery();
                if (rs.next()) {
                    numberOfProducts = rs.getInt(1);
                }
            }
        } finally {
            closeConnection(c, ps, rs);
        }
        return products;
    }
    public boolean updateProduct(ProductDTO productDTO) throws NamingException, SQLException{
        logger.info("Update existing product.");
        try {
            c = DBUtils.makeConnection();
            if (c != null) {
                String sql = "UPDATE dbo.Product SET name=?, price=?, categoryID=?,quantity=?, description=?, date=?,dateExpire=?,status=?, photo=? WHERE productID=?";
                ps = c.prepareStatement(sql);
                ps.setString(1, productDTO.getName());
                ps.setDouble(2, productDTO.getPrice());
                ps.setInt(3, productDTO.getCategoryID());
                ps.setInt(4, productDTO.getQuantity());
                ps.setString(5, productDTO.getDescription());
                ps.setString(6, productDTO.getDate());
                ps.setString(7, productDTO.getDateExpire());
                ps.setString(8, productDTO.getStatus());
                ps.setString(9, productDTO.getPhoto());
                ps.setInt(10, productDTO.getProductId());
                if (ps.executeUpdate() > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection(c, ps, rs);
        }
        return false;
    }
    public boolean updateProductQuantity(int productID,int quantity) throws NamingException, SQLException{
        logger.info("Update Product quantity.");
        try{
            c=DBUtils.makeConnection();
            if(c!=null){
                String sql="UPDATE dbo.Product SET quantity=? WHERE productID=?";
                ps=c.prepareStatement(sql);
                ps.setInt(1, quantity);
                ps.setInt(2, productID);
                if(ps.executeUpdate()>0){
                    return true;
                }
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return false;
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

    public int getNumberOfProducts() {
        return numberOfProducts;
    }

}
