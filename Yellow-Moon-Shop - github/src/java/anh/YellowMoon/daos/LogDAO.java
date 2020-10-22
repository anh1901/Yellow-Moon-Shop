/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.daos;

import anh.YellowMoon.dtos.LogDTO;
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
public class LogDAO {
    final static Logger logger = Logger.getLogger(LogDAO.class.getName());
    Connection c = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean createLog(LogDTO logDTO) throws NamingException, SQLException {
        logger.info("Saving update log.");
        try {
            c=DBUtils.makeConnection();
            if(c!=null){
                String sql="INSERT INTO dbo.History(userID,productID,date) VALUES (?,?,?)";
                ps=c.prepareStatement(sql);
                ps.setInt(1, logDTO.getUserID());
                ps.setInt(2, logDTO.getProductID());
                ps.setString(3, logDTO.getUpdateDate());
                if(ps.executeUpdate()>0){
                    return true;
                }
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return false;
    }
    public ArrayList<LogDTO> getLogs() throws NamingException, SQLException {
        ArrayList<LogDTO> logs=new ArrayList<>();
        try {
            c=DBUtils.makeConnection();
            if(c!=null){
                String sql="Select historyID, userID, productID, date from History order by date DESC";
                ps=c.prepareStatement(sql);
                rs=ps.executeQuery();
                LogDTO logDTO;
                while(rs.next()){
                    logDTO=new LogDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4));
                    logs.add(logDTO);
                }
                return logs;
            }
        }finally{
            closeConnection(c, ps, rs);
        }
        return logs;
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
