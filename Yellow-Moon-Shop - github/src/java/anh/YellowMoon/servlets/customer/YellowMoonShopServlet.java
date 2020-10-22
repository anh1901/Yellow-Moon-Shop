/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.servlets.customer;

import anh.YellowMoon.daos.CategoryDAO;
import anh.YellowMoon.daos.ProductDAO;
import anh.YellowMoon.dtos.CategoryDTO;
import anh.YellowMoon.dtos.ProductDTO;
import anh.YellowMoon.dtos.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
@WebServlet("/YellowMoonShopServlet")
public class YellowMoonShopServlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(YellowMoonShopServlet.class.getName());
    ArrayList<ProductDTO> products =null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            //create GUEST session
            logger.info("Create guest.");
            HttpSession session = request.getSession(true);
            if (session.isNew()) {
                UserDTO userDTO = new UserDTO();
                UUID uuid = UUID.randomUUID();
                userDTO.setUserId("" + uuid);
                userDTO.setRole("GUEST");
                userDTO.setUserName("GUEST");
                session.setAttribute("USER", userDTO);
            }
            //categories
            logger.info("Load categories.");
            ArrayList<CategoryDTO> categories;
            categories = new CategoryDAO().getCategories();
            request.setAttribute("categories", categories);
            //products
            logger.info("Loading product and paging");
            ProductDAO productDAO = new ProductDAO();
            int page = 1;
            int productsPerPage = 20;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int offset = (page - 1) * productsPerPage;
            if (request.getParameter("category") != null) {
                int category = Integer.parseInt(request.getParameter("category"));
                products = productDAO.getProductsByCategoryID(category, offset, productsPerPage);
            } else {
                products = productDAO.getProducts(offset, productsPerPage);
            }
            int numberOfProducts = productDAO.getNumberOfProducts();
            int numberOfPages = (int) Math.ceil(numberOfProducts * 1.0 / productsPerPage);
            request.setAttribute("products", products);
            request.setAttribute("numberOfPages", numberOfPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("query", request.getParameter("category"));

        } catch (NamingException ex) {
            logger.error(ex.getMessage());
        } catch (SQLException ex) {
            logger.error(ex.getMessage());
        } finally {
            request.getRequestDispatcher("yellowmoonshop.jsp").forward(request, response);
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
