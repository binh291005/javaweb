<%-- 
    Document   : ManagerProduct
    Created on : 12 thg 4, 2026, 14:10:12
    Author     : THANH BINH
--%>

<%@page import="model.Category"%>
<%@page import="model.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quản lý sản phẩm</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Icon -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <style>
            body {
                background: #f4f8ff;
                font-family: 'Segoe UI', sans-serif;
            }

            .table-wrapper {
                background: #fff;
                padding: 25px;
                margin-top: 30px;
                border-radius: 15px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            }

            .table-title {
                background: linear-gradient(45deg, #0d6efd, #00c6ff);
                color: #fff;
                padding: 15px 25px;
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .table th {
                background: #f0f6ff;
            }

            .table td img {
                width: 120px;
                height: 80px;
                object-fit: cover;
                border-radius: 8px;
            }

            .btn {
                border-radius: 20px;
            }

            .edit {
                color: orange;
            }

            .delete {
                color: red;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="table-wrapper">

                <!-- TITLE -->
                <div class="table-title d-flex justify-content-between align-items-center">
                    <h4>Quản lý sản phẩm</h4>
                    <div>
                        <button class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#addModal">
                            ➕ Thêm
                        </button>
                    </div>
                </div>

                <!-- TABLE -->
                <%
                    String msg = request.getParameter("msg");
                    if (msg != null) {
                %>

                <div class="alert 
                     <%= msg.contains("success") ? "alert-success" : "alert-danger"%> 
                     alert-dismissible fade show" role="alert">

                    <%
                        if ("add_success".equals(msg)) {
                    %> ✅ Thêm sản phẩm thành công!
                    <% } else if ("edit_success".equals(msg)) { %>
                    ✏️ Cập nhật sản phẩm thành công!
                    <% } else if ("delete_success".equals(msg)) { %>
                    ❌ Xóa sản phẩm thành công!
                    <% } else { %>
                    ⚠️ Có lỗi xảy ra!
                    <% } %>

                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>

                <% } %>
                <table class="table table-bordered table-hover text-center align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Ảnh</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            List<Products> listP = (List<Products>) request.getAttribute("listP");
                            if (listP != null) {
                                for (Products o : listP) {
                        %>
                        <tr>
                            <td><%=o.getId()%></td>
                            <td><%=o.getName()%></td>
                            <td><img src="<%=o.getImage()%>"></td>
                            <td><%=o.getPrice()%>₫</td>
                            <td><%=o.getQuantity()%></td>
                            <td>
                                <a href="edit?pid=<%=o.getId()%>" class="edit">
                                    <i class="material-icons">edit</i>
                                </a>
                                <a href="delete?pid=<%=o.getId()%>" 
                                   class="delete ms-2"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">
                                    <i class="material-icons">delete</i>
                                </a>
                            </td>
                        </tr>
                        <% }
                            } %>
                    </tbody>
                </table>

                <!-- BACK -->
                <a href="Home" class="btn btn-secondary">← Quay lại</a>
            </div>
        </div>

        <!-- ================= ADD MODAL ================= -->
        <div class="modal fade" id="addModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <form action="add" method="post" enctype="multipart/form-data"
                          onsubmit="return confirm('Bạn có chắc muốn thêm sản phẩm?')">

                        <div class="modal-header">
                            <h5>Thêm sản phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <div class="modal-body">

                            <input name="name" class="form-control mb-2" placeholder="Tên sản phẩm" required>

                            <!-- Upload file -->
                            <input type="file" name="imageFile" class="form-control mb-2">

                            <!-- Hoặc nhập link -->
                            <input type="text" name="imageUrl" class="form-control mb-2" placeholder="Hoặc nhập link ảnh">

                            <input name="price" type="text" class="form-control mb-2" placeholder="Giá" required>

                            <input name="quantity" type="number" class="form-control mb-2" placeholder="Số lượng" required>

                            <textarea name="description" class="form-control mb-2" placeholder="Mô tả"></textarea>

                            <select name="category" class="form-select">
                                <%
                                    List<Category> listC = (List<Category>) request.getAttribute("listC");
                                    if (listC != null) {
                                        for (Category c : listC) {
                                %>
                                <option value="<%=c.getCid()%>"><%=c.getCname()%></option>
                                <% }
                                    } %>
                            </select>

                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button class="btn btn-success">Thêm</button>
                        </div>

                    </form>

                </div>
            </div>
        </div>

        <!-- ================= EDIT AUTO OPEN ================= -->
        <%
            Products detail = (Products) request.getAttribute("detail");
            if (detail != null) {
        %>

        <div class="modal fade" id="editModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <form action="edit" method="post" 
                          onsubmit="return confirm('Bạn có chắc muốn cập nhật sản phẩm?')">

                        <div class="modal-header">
                            <h5>Sửa sản phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <div class="modal-body">

                            <input type="hidden" name="id" value="<%=detail.getId()%>">

                            <input name="name" value="<%=detail.getName()%>" class="form-control mb-2">

                            <input name="image" value="<%=detail.getImage()%>" class="form-control mb-2">

                            <input name="price" value="<%=detail.getPrice()%>" class="form-control mb-2">

                            <input name="quantity" value="<%=detail.getQuantity()%>" class="form-control mb-2">

                            <textarea name="description" class="form-control mb-2"><%=detail.getDescription()%></textarea>
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select name="category" class="form-select">
                                    <%
                                        for (Category c : listC) {
                                    %>
                                    <option value="<%=c.getCid()%>"
                                            <%= (detail.getCid() == c.getCid()) ? "selected" : ""%>>
                                        <%=c.getCname()%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button class="btn btn-primary">Lưu</button>
                        </div>

                    </form>

                </div>
            </div>
        </div>

        <script>
            window.onload = function () {
                var modal = new bootstrap.Modal(document.getElementById('editModal'));
                modal.show();
            };
        </script>

        <% }%>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
