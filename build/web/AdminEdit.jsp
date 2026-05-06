<%-- 
    Document   : AdminEdit
    Created on : May 6, 2026, 10:11:29 AM
    Author     : THANH BINH
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa tài khoản</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: #f5f7fa;
            }
            .edit-box {
                background: #fff;
                padding: 35px;
                border-radius: 15px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
                margin-top: 40px;
            }
            h3 {
                color: #007bff;
                font-weight: bold;
            }
            .form-control, .form-select {
                border-radius: 10px;
            }
            .btn-custom {
                border-radius: 20px;
                padding: 8px 25px;
                font-weight: 600;
            }
            .form-label {
                font-weight: 600;
                color: #444;
            }
        </style>
    </head>
    <body>
        <%
            Account user = (Account) session.getAttribute("acc");
            Account acc = (Account) request.getAttribute("acc");
            if (acc == null) {
                response.sendRedirect("accountManager");
                return;
            }
        %>

        <div class="container" style="max-width: 650px;">
            <div class="edit-box">

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3>✏️ Sửa tài khoản</h3>
                    <a href="accountManager" class="btn btn-outline-secondary btn-custom">← Quay lại</a>
                </div>

                <form action="accountManager" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%=acc.getId()%>">

                    <div class="mb-3">
                        <label class="form-label">UserAccount</label>
                        <input name="userAccount" class="form-control" value="<%=acc.getUseraccount()%>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input name="username" class="form-control" value="<%=acc.getUsername()%>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input name="email" type="email" class="form-control" value="<%=acc.getEmail()%>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Số điện thoại</label>
                        <input name="numberphone" class="form-control" value="<%=acc.getNumberphone()%>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Địa chỉ</label>
                        <input name="address" class="form-control" value="<%=acc.getAddress()%>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mật khẩu mới <small class="text-muted">(để trống nếu không đổi)</small></label>
                        <div class="input-group">
                            <input name="password" id="pwdInput" type="password" class="form-control" placeholder="Nhập mật khẩu mới...">
                            <button type="button" class="btn btn-outline-secondary" onclick="togglePwd()">👁️</button>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Quyền Admin</label>
                            <select name="idadmin" class="form-select">
                                <option value="0" <%=acc.getIdadmin() == 0 ? "selected" : ""%>>👤 User</option>
                                <option value="1" <%=acc.getIdadmin() == 1 ? "selected" : ""%>>🛡️ Admin</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Quyền Seller</label>
                            <select name="idsell" class="form-select">
                                <option value="0" <%=acc.getIdsell() == 0 ? "selected" : ""%>>❌ Không</option>
                                <option value="1" <%=acc.getIdsell() == 1 ? "selected" : ""%>>🏪 Seller</option>
                            </select>
                        </div>
                    </div>

                    <div class="d-flex gap-2 mt-2">
                        <button type="submit" class="btn btn-primary btn-custom">💾 Lưu thay đổi</button>
                        <a href="accountManager" class="btn btn-outline-secondary btn-custom">Hủy</a>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                function togglePwd() {
                                    const input = document.getElementById('pwdInput');
                                    input.type = input.type === 'password' ? 'text' : 'password';
                                }
        </script>
    </body>
</html>