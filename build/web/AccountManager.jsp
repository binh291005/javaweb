<%-- 
    Document   : AccountManager
    Created on : May 6, 2026, 10:10:19 AM
    Author     : THANH BINH
--%>

<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý tài khoản</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: #f5f7fa;
            }

            .container-box {
                background: #fff;
                padding: 25px;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                margin-top: 20px;
            }

            h2 {
                font-weight: bold;
                color: #007bff;
            }

            /* Form */
            .form-control {
                border-radius: 10px;
            }

            .btn-custom {
                border-radius: 20px;
                padding: 6px 15px;
                font-weight: 600;
            }

            /* Table */
            table {
                border-radius: 10px;
                overflow: hidden;
            }

            table th {
                background: #007bff;
                color: white;
                text-align: center;
            }

            table td {
                vertical-align: middle;
                text-align: center;
            }

            tr:hover {
                background: #f1f1f1;
            }

            /* Pagination */
            .pagination a {
                margin: 0 5px;
                padding: 6px 12px;
                border-radius: 10px;
                background: #e9ecef;
                text-decoration: none;
            }

            .pagination a:hover {
                background: #007bff;
                color: white;
            }
        </style>
    </head>
    <body>
        <%
            Account user = (Account) session.getAttribute("acc");
            List<Account> list = (List<Account>) request.getAttribute("list");
            String msg = request.getParameter("msg");
        %>

        <!-- TOAST THÔNG BÁO -->
        <div class="toast-container">
            <% if ("added".equals(msg)) { %>
            <div class="toast align-items-center text-bg-success border-0 show" role="alert">
                <div class="d-flex">
                    <div class="toast-body">✅ Thêm tài khoản thành công!</div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
            <% } else if ("updated".equals(msg)) { %>
            <div class="toast align-items-center text-bg-primary border-0 show" role="alert">
                <div class="d-flex">
                    <div class="toast-body">✏️ Cập nhật tài khoản thành công!</div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
            <% } else if ("deleted".equals(msg)) { %>
            <div class="toast align-items-center text-bg-danger border-0 show" role="alert">
                <div class="d-flex">
                    <div class="toast-body">🗑️ Xóa tài khoản thành công!</div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
            <% }%>
        </div>
        <div class="container">

            <div class="container-box">

                <h2>Xin chào: <%=user.getUsername()%></h2>

                <!-- SEARCH -->
                <form action="accountManager" class="row g-2 mb-3">
                    <input type="hidden" name="action" value="search">
                    <div class="col-md-4">
                        <input name="keyword" class="form-control" placeholder="Tìm kiếm...">
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary btn-custom">Tìm</button>
                    </div>
                </form>

                <!-- ADD -->
                <% if (user.getIdadmin() == 1) { %>
                <form action="accountManager" method="post" class="row g-2 mb-3">
                    <input type="hidden" name="action" value="add">

                    <div class="col"><input name="userAccount" class="form-control" placeholder="Tên tài khoản"></div>
                    <div class="col"><input name="username" class="form-control" placeholder="Tên đăng nhập"></div>
                    <div class="col"><input name="email" class="form-control" placeholder="Email"></div>
                    <div class="col"><input name="numberphone" class="form-control" placeholder="Số điện thoại"></div>
                    <div class="col"><input name="address" class="form-control" placeholder="Địa chỉ"></div>
                    <div class="col"><input name="password" class="form-control" placeholder="Mật khẩu"></div>
                    <div class="col">
                        <select name="idadmin" class="form-select">
                            <option value="0">👤 Người dùng</option>
                            <option value="1">🛡️ Admin</option>
                        </select>
                        <div class="col">
                            <select name="idsell" class="form-select">
                                <option value="0">Không bán</option>
                                <option value="1">🏪 Người bán</option>
                            </select>
                        </div>
                    </div>
                    <div class="col">
                        <button class="btn btn-success btn-custom">➕ Thêm</button>
                    </div>
                </form>
                <% } %>

                <!-- TABLE -->
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Tên đăng nhập</th>
                            <th>Vai trò</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (list != null) {
                                for (Account a : list) {%>
                        <tr>
                            <td><%=a.getUsername()%></td>
                            <td><%=a.getIdadmin() == 1 ? "Admin" : "User"%></td>
                            <td>
                                <% if (user.getIdadmin() == 1) {%>
                                <a href="accountManager?action=delete&id=<%=a.getId()%>" class="btn btn-danger btn-sm">🗑️ Xóa</a>
                                <a href="accountManager?action=edit&id=<%=a.getId()%>" class="btn btn-warning btn-sm">✏️ Sửa</a>
                                <% } %>
                            </td>
                        </tr>
                        <% }
                            }%>
                    </tbody>
                </table>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <a href="Home" class="btn btn-outline-primary btn-custom">
                        🏠 Quay lại trang chủ
                    </a>
                </div>
            </div>
        </div>
        <!-- MODAL XÁC NHẬN XÓA -->
        <div class="modal fade" id="deleteModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title">⚠️ Xác nhận xóa</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc muốn xóa tài khoản <strong id="deleteUsername"></strong> không?
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <a id="deleteConfirmBtn" href="#" class="btn btn-danger">Xóa</a>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Tự động ẩn toast sau 3 giây
            document.querySelectorAll('.toast').forEach(t => {
                setTimeout(() => {
                    t.classList.remove('show');
                }, 3000);
            });

            // Modal xóa
            function confirmDelete(id, username) {
                document.getElementById('deleteUsername').innerText = username;
                document.getElementById('deleteConfirmBtn').href = 'accountManager?action=delete&id=' + id;
                new bootstrap.Modal(document.getElementById('deleteModal')).show();
            }
        </script>
    </body>
</html>
