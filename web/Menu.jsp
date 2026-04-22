<%-- 
    Document   : Menu
    Created on : 10 thg 4, 2026, 10:41:46
    Author     : THANH BINH
--%>

<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    /* ===== MENU TRÊN ===== */
    .navbar {
        background: linear-gradient(90deg, #0d6efd, #00c6ff);
        padding: 10px 0;
        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        align-items: center;
    }

    .navbar .nav-link {
        color: #fff !important;
        font-size: 15px;
        margin: 0 8px;
        transition: 0.3s;
        white-space: nowrap;
    }

    .navbar .nav-link:hover {
        color: #ffd43b !important;
    }

    /* Logo */
    .navbar-brand img {
        width: 70px;
        border-radius: 10px;
    }

    /* Search */
    .input-group input {
        border-radius: 20px 0 0 20px;
    }

    .input-group button {
        border-radius: 0 20px 20px 0;
    }

    /* Giỏ hàng */
    .btn-success {
        border-radius: 20px;
        padding: 6px 15px;
        font-weight: 600;
        background: #28a745;
        border: none;
    }

    .btn-success:hover {
        background: #218838;
    }

    /* ===== MENU DƯỚI ===== */
    .top-menu {
        background: #fff;
        padding: 8px 0;
        border-radius: 15px;
        margin: 20px auto;
        width: 95%;
        box-shadow: 0 5px 15px rgba(0,0,0,0.08);
    }

    .top-menu .nav-link {
        color: #007bff !important;
        font-weight: 600;
        padding: 8px 16px;
        border-radius: 25px;
        transition: 0.3s;
    }

    .top-menu .nav-link:hover {
        background: #007bff;
        color: #fff !important;
    }

    .top-menu .nav-link.active {
        background: linear-gradient(45deg, #007bff, #00c6ff);
        color: #fff !important;
    }

    /* Icon spacing */
    .top-menu .nav-link i,
    .top-menu .nav-link span {
        margin-right: 4px;
    }
    .top-menu {
        margin-bottom: 25px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1); /* tạo chiều sâu */
    }
</style>

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="Home"><img src="img/logo.png" width="100px" alt="logo"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <%
            model.Account acc = (model.Account) session.getAttribute("acc");
        %>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <%
                    if (acc != null && acc.isIdadmin() == true) {
                %> 
                <li class="nav-item">
                    <a class="nav-link" href="#">Quản lý tài khoản</a>
                </li>
                <%
                    }
                %>
                <%
                    if (acc != null && acc.isIdsell() == true) {
                %> 
                <li class="nav-item">
                    <a class="nav-link" href="managerproduct">Quản lý sản phẩm</a>
                </li>
                <%
                    }
                %>
                <%
                    if (acc != null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Đăng xuất</a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="Login.jsp">Đăng nhập</a>
                </li>
                <%
                    }
                %>
            </ul>

            <div class="d-flex align-items-center">

                <form action="search" method="post" class="form-inline mr-3">
                    <div class="input-group input-group-sm">
                        <input name="txt" type="text" value="${txtS}" 
                               class="form-control" placeholder="Search...">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-light">
                                🔍
                            </button>
                        </div>
                    </div>
                </form>

                <a class="btn btn-success btn-sm mr-3" href="show">
                    🛒 Giỏ hàng <span class="badge badge-light">3</span>
                </a>

            </div>
            <%
                if (acc != null) {
            %>
            <%
                if (acc != null) {
            %>
            <a class="nav-link text-white ml-3"><%= acc.getUseraccount()%></a>
            <%
                }
            %>
            <%
                }
            %>
        </div>
    </div>
</nav>
<!--<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Siêu thị giày chất lượng cao</h1>
        <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu với hơn 10 năm cung cấp các sản phầm giày nhập từ Trung Quốc</p>
    </div>
</section>-->
<%
    List<Category> listC = (List<Category>) request.getAttribute("listC");
%>

<nav class="navbar navbar-expand-md top-menu">
    <div class="container">

        <ul class="navbar-nav mx-auto">

            <!-- Tất cả -->
            <li class="nav-item">
                <a class="nav-link 
                   <%= (request.getAttribute("type") == null && request.getAttribute("cid") == null ? "active" : "")%>" 
                   href="Home">
                    TẤT CẢ
                </a>
            </li>

            <!-- Category -->
            <%
                String type = (String) request.getAttribute("type");
                Integer currentCid = (Integer) request.getAttribute("cid");

                if (listC != null) {
                    for (Category c : listC) {
            %>
            <li class="nav-item">
                <a class="nav-link 
                   <%= (type == null && currentCid != null && currentCid == c.getCid()) ? "active" : ""%>" 
                   href="category?cid=<%=c.getCid()%>">
                    <%=c.getCname()%>
                </a>
            </li>
            <%
                    }
                }
            %>

            <!-- New -->
            <li class="nav-item">
                <a class="nav-link <%= "new".equals(request.getAttribute("type")) ? "active" : ""%>" href="new">
                    MỚI NHẤT
                </a>
            </li>

            <!-- Best -->
            <li class="nav-item">
                <a class="nav-link <%= "best".equals(request.getAttribute("type")) ? "active" : ""%>" href="best">
                    BÁN CHẠY
                </a>
            </li>

        </ul>

    </div>
</nav>

<!--end of menu-->
