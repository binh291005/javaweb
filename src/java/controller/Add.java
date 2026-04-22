/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Account;
import model.ProductsDAO;

/**
 *
 * @author THANH BINH
 */
@MultipartConfig
public class Add extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");

        String quantity_raw = request.getParameter("quantity");
        String category_raw = request.getParameter("category");
        if (quantity_raw == null || quantity_raw.isEmpty()
                || category_raw == null || category_raw.isEmpty()) {

            response.sendRedirect("managerproduct?msg=missing_data");
            return;
        }
        int quantity = Integer.parseInt(quantity_raw);
        int category = Integer.parseInt(category_raw);

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");

        if (a == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int sid = a.getId();

        Part filePart = request.getPart("imageFile");
        String imageUrl = request.getParameter("imageUrl");

        String image = null;

        // 👉 CASE 1: Upload file
        if (filePart != null && filePart.getSize() > 0) {

            String fileName = filePart.getSubmittedFileName();

            // đường dẫn lưu ảnh
            String uploadPath = getServletContext().getRealPath("") + "img";

            java.io.File uploadDir = new java.io.File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            filePart.write(uploadPath + "/" + fileName);

            image = "img/" + fileName; // lưu đường dẫn DB
        } // 👉 CASE 2: nhập link
        else if (imageUrl != null && !imageUrl.trim().isEmpty()) {
            image = imageUrl;
        } // 👉 lỗi
        else {
            response.sendRedirect("managerproduct?msg=no_image");
            return;
        }

        ProductsDAO dao = new ProductsDAO();
        dao.addProduct(name, image, price, description, category, sid, quantity);

        response.sendRedirect("managerproduct?msg=add_success");
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
