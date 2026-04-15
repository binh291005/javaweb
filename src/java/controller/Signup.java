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
import model.Account;
import model.ProductsDAO;

/**
 *
 * @author THANH BINH
 */
public class Signup extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String useraccount = request.getParameter("useraccount");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneRaw = request.getParameter("phone");
        String address = request.getParameter("address");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        int phone = Integer.parseInt(phoneRaw);
        ProductsDAO dao = new ProductsDAO();
        Account a = dao.checkAccount(username);
     
        // ❌ Check email
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("mess", "Email không hợp lệ!");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        // ❌ Check phone
        if (!phoneRaw.matches("\\d{9,11}")) {
        request.setAttribute("mess", "SĐT phải 9-11 số");
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
        return;
    }

        // ❌ Check password
        if (pass.length() < 6) {
            request.setAttribute("mess", "Mật khẩu phải >= 6 ký tự!");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        // ❌ Check repass
        if (!pass.equals(repass)) {
            request.setAttribute("mess", "Mật khẩu nhập lại không đúng!");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        // ❌ Check trùng username
        if (dao.checkAccount(username) != null) {
            request.setAttribute("mess", "Tên đăng nhập đã tồn tại!");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        dao.signup(useraccount, username, email, phone, address, pass);

        response.sendRedirect("Login.jsp");
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
