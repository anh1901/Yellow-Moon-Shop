/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.servlets.admin;

import anh.YellowMoon.daos.LogDAO;
import anh.YellowMoon.daos.UserDAO;
import anh.YellowMoon.dtos.LogDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
public class LogServlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(LogServlet.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            ArrayList<LogDTO> logs;
            HashMap<Integer, String> mapName=new HashMap<>() ;
            HashMap<Integer, LogDTO> mapLog=new HashMap<>() ;
            
            LogDAO logDAO=new LogDAO();
            logs=logDAO.getLogs();
            UserDAO userDAO=new UserDAO();
            String name;
            for (LogDTO log : logs) {
                name=userDAO.getNameFromID(log.getUserID());
                mapName.put(log.getLogID(), name);
                mapLog.put(log.getLogID(), log);
            }
            request.setAttribute("MAPLOG", mapLog);
            request.setAttribute("MAPNAME", mapName);
        } catch (NamingException ex) {
            logger.error(ex.getMessage());
        } catch (SQLException ex) {
            logger.error(ex.getMessage());
        }finally{
            request.getRequestDispatcher("admin/log.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
