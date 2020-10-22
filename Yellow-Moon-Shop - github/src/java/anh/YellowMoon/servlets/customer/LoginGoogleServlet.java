/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.servlets.customer;

import anh.YellowMoon.dtos.GoogleUserDTO;
import anh.YellowMoon.dtos.UserDTO;
import anh.YellowMoon.utils.GoogleUtils;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class LoginGoogleServlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(LoginGoogleServlet.class.getName());
    public LoginGoogleServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.info("Login with google");
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GoogleUserDTO googleUser = GoogleUtils.getUserInfo(accessToken);
//            request.setAttribute("id", googleUser.getId());
//            request.setAttribute("name", googleUser.getName());
//            request.setAttribute("email", googleUser.getEmail());
            HttpSession session = request.getSession();
            UserDTO userDTO = new UserDTO();
            userDTO.setUserId(googleUser.getId());
            userDTO.setRole("USER");
            userDTO.setEmail(googleUser.getEmail());
            userDTO.setUserName("Anh Nguyen");
            session.setAttribute("USER", userDTO);
            RequestDispatcher dis = request.getRequestDispatcher("YellowMoonShopServlet");
            dis.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
