/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Products;
import model.ProductsDAO;

/**
 *
 * @author THANH BINH
 */
public class Edit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String pid = request.getParameter("pid");
        ProductsDAO dao = new ProductsDAO();

        Products p = dao.getProductByID(pid);
        List<model.Category> listC = dao.getAllCategory();
        List<Products> listP = dao.getAll();
        request.setAttribute("listP", listP);

        request.setAttribute("detail", p);
        request.setAttribute("listC", listC);

        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
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
        ProductsDAO dao = new ProductsDAO();

        try {
            String id_raw = request.getParameter("id");
            String quantity_raw = request.getParameter("quantity");
            String category_raw = request.getParameter("category");
            if (id_raw == null || quantity_raw == null || category_raw == null
                    || id_raw.isEmpty() || quantity_raw.isEmpty() || category_raw.isEmpty()) {

                response.sendRedirect("managerproduct");
                return;
            }
            int id = Integer.parseInt(id_raw);
            int quantity = Integer.parseInt(quantity_raw);
            int category = Integer.parseInt(category_raw);

            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String price = request.getParameter("price");
            String description = request.getParameter("description");
            

            dao.editProduct(name, image, price, description, category, id, quantity);

            response.sendRedirect("managerproduct?msg=edit_success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("managerproduct");
        }
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
