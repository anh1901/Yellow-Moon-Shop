/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.servlets.customer;

import anh.YellowMoon.cart.CartObj;
import anh.YellowMoon.daos.OrderDAO;
import anh.YellowMoon.daos.ProductDAO;
import anh.YellowMoon.dtos.OrderDTO;
import anh.YellowMoon.dtos.OrderDetailDTO;
import anh.YellowMoon.dtos.ProductDTO;
import anh.YellowMoon.dtos.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.UUID;
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
public class CheckOutServlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(CheckOutServlet.class.getName());
    private static final String FAIL = "invalid.jsp";
    private static final String SUCCESS = "receipt.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            //order
            HttpSession session=request.getSession(false);
            String customerID = ""+session.getAttribute("customerID");
            String customerAddress = ""+session.getAttribute("customerAddress");
            String customerPhone = ""+session.getAttribute("customerPhone");
            String customerEmail = ""+session.getAttribute("customerEmail");
            String subtotal = ""+session.getAttribute("subtotal");
            String ship = ""+session.getAttribute("ship");
            String tax = ""+session.getAttribute("tax");
            String realTotal = ""+session.getAttribute("realTotal");
            int orderID=0;
            OrderDTO orderDTO = new OrderDTO(customerID, customerAddress, Integer.parseInt(customerPhone), customerEmail, ("" + new Timestamp(System.currentTimeMillis())).substring(0, 19) + ".000", Double.parseDouble(subtotal), Double.parseDouble(ship), Double.parseDouble(tax), Double.parseDouble(realTotal));
            OrderDAO orderDAO = new OrderDAO();
            if (!orderDAO.createOrder(orderDTO)) {
                url = FAIL;
                request.setAttribute("ERROR", "Fail when creating order.");
            }else{
                orderID=orderDAO.getOrderIDByDateTime(("" + new Timestamp(System.currentTimeMillis())).substring(0, 19) + ".000");
            }
            //order detail
            ArrayList<OrderDetailDTO> details = new ArrayList<>();
            OrderDetailDTO orderDetailDTO;
            CartObj cart = (CartObj) session.getAttribute("CART");
            for (int key : cart.getItems().keySet()) {
                ProductDAO productDAO = new ProductDAO();
                orderDetailDTO = new OrderDetailDTO(orderDAO.getOrderIDByDateTime(("" + new Timestamp(System.currentTimeMillis())).substring(0, 19) + ".000"), key, productDAO.getProductByID(key).getPrice() * cart.getItems().get(key), cart.getItems().get(key));
                details.add(orderDetailDTO);
                ProductDTO productDTO;
                productDTO=productDAO.getProductByID(key);
                if((productDTO.getQuantity()-cart.getItems().get(key))<0){
                    request.setAttribute("ERROR", "Not enough in the stock.Try again later.");
                    request.getRequestDispatcher("invalid.jsp").forward(request, response);
                }else{
                    productDAO.updateProductQuantity(key, productDTO.getQuantity()-cart.getItems().get(key));
                }
            }
            for (int i = 0; i < details.size(); i++) {
                if (!orderDAO.createOrderDetail(details.get(i))) {
                    url = FAIL;
                    request.setAttribute("ERROR", "Fail when creating order detail.");
                }
            }
            if (url.equalsIgnoreCase(SUCCESS)) {
                session.removeAttribute("CART");
                UserDTO user;
                user = (UserDTO) session.getAttribute("USER");
                if (user.getRole().equalsIgnoreCase("GUEST")) {
                    UserDTO userDTO = new UserDTO();
                    UUID uuid = UUID.randomUUID();
                    userDTO.setUserId("" + uuid);
                    userDTO.setRole("GUEST");
                    userDTO.setUserName("GUEST");
                    session.setAttribute("USER", userDTO);
                }
            }
            session.setAttribute("ORDERID", orderID);
            response.sendRedirect(url);
        } catch (SQLException ex) {
            logger.error(ex.getMessage());
        } catch (NamingException ex) {
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
