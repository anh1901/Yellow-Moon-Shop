/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.daos;

import anh.YellowMoon.dtos.CategoryDTO;
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
public class CategoryDAO {
    final static Logger logger = Logger.getLogger(CategoryDAO.class.getName());
    Connection c = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public ArrayList<CategoryDTO> getCategories() throws NamingException, SQLException{
        logger.info("Get all categories.");
        ArrayList<CategoryDTO> categories=new ArrayList<>();
        try{
            c=DBUtils.makeConnection();
            if(c!= null){
                String sql="select catagoryID, Name from category";
                ps=c.prepareStatement(sql);
                rs=ps.executeQuery();
                while(rs.next()){
                    CategoryDTO category;
                    category=new CategoryDTO(rs.getInt(1), rs.getString(2));
                    categories.add(category);
                }
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return categories;
    }
    public int getCategoryIDFromName(String name) throws NamingException, SQLException{
        logger.info("Get category ID from category name");
        try{
            c=DBUtils.makeConnection();
            if(c!= null){
                String sql="select catagoryID from category where name=?";
                ps=c.prepareStatement(sql);
                ps.setString(1, name);
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
    public String getNameFromCategoryID(int id) throws NamingException, SQLException{
        logger.info("Get name from category ID");
        try{
            c=DBUtils.makeConnection();
            if(c!= null){
                String sql="select name from category where catagoryID=?";
                ps=c.prepareStatement(sql);
                ps.setInt(1, id);
                rs=ps.executeQuery();
                if(rs.next()){
                    return rs.getString(1);
                }
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return null;
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
