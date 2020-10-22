/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.servlets.admin;

import anh.YellowMoon.daos.CategoryDAO;
import anh.YellowMoon.daos.ProductDAO;
import anh.YellowMoon.dtos.ProductDTO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
public class CreateCakeServlet extends HttpServlet {

    private ServletFileUpload uploader = null;
    private static final String SUCCESS = "admin/index.jsp";
    private static final String FAIL = "invalid.jsp";

    @Override
    public void init() throws ServletException {
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }
    final static Logger logger = Logger.getLogger(CreateCakeServlet.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = FAIL;
        try {
            String photo = "";
            ArrayList<String> formFieldValues = new ArrayList<>();
            List<FileItem> fileItemsList = uploader.parseRequest(request);
            int i = 0;
            for (FileItem fileItem : fileItemsList) {
                if (fileItem.isFormField()) {
                    formFieldValues.add(fileItem.getString());
                    i++;
                } else {
                    photo = new File(fileItem.getName()).getName();
                    File storeImage = new File("D:\\LAB\\J3.L.P0011.-Yellow-Moon-Shop\\web\\images\\" + photo);
                    storeImage.delete();
                    fileItem.write(storeImage);
                    logger.debug("Image name:" + photo);
                }
            }
            
            CategoryDAO categoryDAO = new CategoryDAO();
            ProductDTO productDTO = new ProductDTO(formFieldValues.get(0), Double.parseDouble(formFieldValues.get(1)), formFieldValues.get(5), photo, formFieldValues.get(4), Integer.parseInt(formFieldValues.get(3)), categoryDAO.getCategoryIDFromName(formFieldValues.get(2)), formFieldValues.get(6));
            ProductDAO productDAO = new ProductDAO();
            if (productDAO.addProduct(productDTO)) {
                url = SUCCESS;
            }
        } catch (FileUploadException ex) {
            logger.error(ex.getMessage());
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        } finally {
            response.sendRedirect(url);
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
