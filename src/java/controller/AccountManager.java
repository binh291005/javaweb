/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountDAO;
import model.PasswordUtils;

/**
 *
 * @author THANH BINH
 */
public class AccountManager extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountManager at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        Account user = (Account) request.getSession().getAttribute("acc");
        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        AccountDAO dao = new AccountDAO();
        String action = request.getParameter("action");

        if (action == null) {
            int index = Integer.parseInt(request.getParameter("index") == null ? "1" : request.getParameter("index"));
            request.setAttribute("index", index);
            request.setAttribute("list", dao.search(""));
            request.getRequestDispatcher("AccountManager.jsp").forward(request, response);
            return;
        } else if ("delete".equals(action)) {
            if (user.getIdadmin() != 1) {
                response.sendRedirect("accountManager");
                return;
            }
            dao.delete(Integer.parseInt(request.getParameter("id")));
            response.sendRedirect("accountManager?msg=deleted");
            return;
        } else if ("edit".equals(action)) {
            request.setAttribute("acc", dao.getById(Integer.parseInt(request.getParameter("id"))));
            request.getRequestDispatcher("AdminEdit.jsp").forward(request, response);
            return;
        } else if ("search".equals(action)) {
            request.setAttribute("list", dao.search(request.getParameter("keyword")));
            request.getRequestDispatcher("AccountManager.jsp").forward(request, response);
            return;
        }
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
        Account user = (Account) request.getSession().getAttribute("acc");
        if (user.getIdadmin() != 1) {
            response.sendRedirect("accountManager");
            return;
        }
        int idsell = Integer.parseInt(request.getParameter("idsell") == null ? "0" : request.getParameter("idsell"));
        int idadmin = Integer.parseInt(request.getParameter("idadmin") == null ? "0" : request.getParameter("idadmin"));

        AccountDAO dao = new AccountDAO();
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            dao.insert(new Account(0,
                    request.getParameter("userAccount"),
                    request.getParameter("username"),
                    request.getParameter("email"),
                    request.getParameter("numberphone"),
                    request.getParameter("address"),
                    PasswordUtils.toMD5(request.getParameter("password")),
                    idsell, idadmin));
            response.sendRedirect("accountManager?msg=added");
            return;
        } else if ("update".equals(action)) {
            dao.update(new Account(
                    Integer.parseInt(request.getParameter("id")),
                    request.getParameter("userAccount"),
                    request.getParameter("username"),
                    request.getParameter("email"),
                    request.getParameter("numberphone"),
                    request.getParameter("address"),
                    PasswordUtils.toMD5(request.getParameter("password")),
                    idsell, idadmin));
            response.sendRedirect("accountManager?msg=updated");
            return;
        }

        response.sendRedirect("accountManager");
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
