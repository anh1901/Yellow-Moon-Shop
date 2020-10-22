/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.servlets.customer;

import anh.YellowMoon.daos.UserDAO;
import anh.YellowMoon.dtos.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
public class LoginServlet extends HttpServlet {

    final static Logger logger = Logger.getLogger(LoginServlet.class.getName());
    private final String SUCCESSUSER = "yellowMoonShop";
    private final String SUCCESSADMIN = "admin/index.jsp";
    private final String FAIL = "invalid.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = FAIL;
        try {
            response.setContentType("text/html;charset=UTF-8");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserDAO userDAO = new UserDAO();
            if (userDAO.checkUserExist(email)) {
                UserDTO userDTO = userDAO.checkLogin(email, password);
                if (userDTO == null) {
                    request.setAttribute("ERROR", "Wrong username or password.");
                    request.getRequestDispatcher(url).forward(request, response);
                }
                HttpSession session = request.getSession(false);
                session.setAttribute("USER", userDTO);
                if (userDTO.getRole().equalsIgnoreCase("ADMIN")) {
                    response.sendRedirect(SUCCESSADMIN);
                } else if (userDTO.getRole().equalsIgnoreCase("USER")) {
                    response.sendRedirect(SUCCESSUSER);
                } else {
                    request.setAttribute("ERROR", "Your role is invalid.");
                    request.getRequestDispatcher(url).forward(request, response);
                }
            }else{
                request.setAttribute("ERROR", "User not existed in the database.");
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (NamingException ex) {
            logger.error(ex.getMessage());
        } catch (SQLException ex) {
            logger.error(ex.getMessage());
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
