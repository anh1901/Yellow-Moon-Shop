/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.servlets.admin;

//import anh.YellowMoon.daos.CategoryDAO;
import anh.YellowMoon.daos.CategoryDAO;
import anh.YellowMoon.daos.LogDAO;
import anh.YellowMoon.daos.ProductDAO;
import anh.YellowMoon.dtos.CategoryDTO;
import anh.YellowMoon.dtos.LogDTO;
import anh.YellowMoon.dtos.ProductDTO;
import anh.YellowMoon.dtos.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class UpdateServlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(UpdateServlet.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url;
        try {
            String id = request.getParameter("productId");
            String name = request.getParameter("cakeName");
            String price = request.getParameter("cakePrice");
            String categoryID = request.getParameter("category");
            String quantity = request.getParameter("quantity");
            String description = request.getParameter("description");
            String startDate = request.getParameter("startDate");
            String expireDate = request.getParameter("expireDate");
            String status = request.getParameter("status");
            String photo = request.getParameter("photo");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            //categories
            ArrayList<CategoryDTO> categories;
            categories = new CategoryDAO().getCategories();
            request.setAttribute("categories", categories);
            Date start = sdf.parse(startDate);
            Date end = sdf.parse(expireDate);
            Date today=new Date();
            if(today.after(start)){
                request.setAttribute("ERROR1", "Start date is smaller than today.");
                request.getRequestDispatcher("admin/detail.jsp?productId=" + id + "&status=" + status + "&categoryID=" + categoryID + "&name=" + name + "&date=" + startDate + "&dateExpire=" + expireDate + "&price=" + price + "&description=" + description + "&quantity=" + quantity).forward(request, response);
            }else if (start.after(end)) {
                request.setAttribute("ERROR2", "Expire date is smaller than start date.");
                request.getRequestDispatcher("admin/detail.jsp?productId=" + id + "&status=" + status + "&categoryID=" + categoryID + "&name=" + name + "&date=" + startDate + "&dateExpire=" + expireDate + "&price=" + price + "&description=" + description + "&quantity=" + quantity).forward(request, response);
            } else {
                //CategoryDAO categoryDAO=new CategoryDAO();
                ProductDTO productDTO = new ProductDTO(Integer.parseInt(id), name, Double.parseDouble(price), startDate, description, Integer.parseInt(quantity), Integer.parseInt(categoryID), expireDate, status,photo);
                ProductDAO productDAO = new ProductDAO();
                if (!productDAO.updateProduct(productDTO)) {
                    request.setAttribute("ERROR", "Update fail.");
                } else {
                    //update log
                    HttpSession session = request.getSession(false);
                    UserDTO userDTO = (UserDTO) session.getAttribute("USER");
                    LogDAO logDAO = new LogDAO();
                    LogDTO logDTO = new LogDTO(Integer.parseInt(userDTO.getUserId()), Integer.parseInt(id), "" + new Timestamp(System.currentTimeMillis()));
                    if (logDAO.createLog(logDTO)) {
                        url = "admin/search.jsp";
                    } else {
                        request.setAttribute("ERROR", "Create log fail.");
                        url = "invalid.jsp";
                    }
                    response.sendRedirect(url);
                }
            }
        } catch (NamingException ex) {
            logger.error(ex.getMessage());
        } catch (SQLException ex) {
            logger.error(ex.getMessage());
        } catch (ParseException ex) {
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
