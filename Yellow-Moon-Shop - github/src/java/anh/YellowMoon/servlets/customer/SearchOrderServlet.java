/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.servlets.customer;

import anh.YellowMoon.daos.OrderDAO;
import anh.YellowMoon.dtos.OrderDTO;
import anh.YellowMoon.dtos.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class SearchOrderServlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(SearchOrderServlet.class.getName());
    private static final String ADMIN = "admin/orders.jsp";
    private static final String USER = "track.jsp";
    private static final String FAIL = "invalid.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FAIL;
        try {
            String searchID = request.getParameter("searchID");
            HttpSession session = request.getSession(false);
            ArrayList<OrderDTO> orders = new ArrayList<>();
            UserDTO userDTO = (UserDTO) session.getAttribute("USER");
            OrderDAO orderDAO = new OrderDAO();
            OrderDTO order;
            if (userDTO.getRole().equalsIgnoreCase("USER")) {
                order = orderDAO.searchOrderOfUser(userDTO.getUserId(), Integer.parseInt(searchID));
                if (order != null) {
                    orders.add(order);
                }
                session.setAttribute("orders", orders);
                url = USER;
            } else if (userDTO.getRole().equalsIgnoreCase("ADMIN")) {
                order = orderDAO.searchOrdersAdmin(Integer.parseInt(searchID));
                if (order != null) {
                    orders.add(order);
                }
                session.setAttribute("orders", orders);
                url = ADMIN;
            }else {
                request.setAttribute("ERROR", "Your role is invalid");
            }
        } catch (NamingException ex) {
            logger.error(ex.getMessage());
        } catch (SQLException ex) {
            logger.error(ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
