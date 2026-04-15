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
        padding: 8px 0;
    }

    .navbar .nav-link {
        font-size: 14px;
        color: #ddd !important;
        transition: 0.3s;
    }

    .navbar .nav-link:hover {
        color: #ff6600 !important;
    }

    /* ===== MENU DƯỚI ===== */
    .top-menu {
        background: #007bff;
        padding: 5px 0; /* nhỏ lại */
    }

    /* Link menu dưới */
    .top-menu .nav-link {
        color: #fff !important;
        font-size: 13px; /* nhỏ hơn */
        font-weight: 500;
        padding: 6px 12px; /* gọn hơn */
        margin: 0 3px;
        border-radius: 20px; /* bo tròn đẹp */
        transition: all 0.3s ease;
    }

    /* Hover */
    .top-menu .nav-link:hover {
        background: #fff;
        color: #ff6600 !important;
    }

    /* Active */
    .top-menu .nav-link.active {
        background: #fff;
        color: #ff6600 !important;
        font-weight: bold;
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
                    <p class="nav-link">Xin Chào <%=acc.getUseraccount()%></p>
                </li>
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

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input name="txt" type="text" value="${txtS}" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="show">
                    <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    <span class="badge badge-light">3</span>
                </a>
            </form>
            <%
                if (acc != null) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="#"><%= acc.getUseraccount()%></a>
            </li>
            <%
                }
            %>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Siêu thị giày chất lượng cao</h1>
        <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu với hơn 10 năm cung cấp các sản phầm giày nhập từ Trung Quốc</p>
    </div>
</section>
<%
    List<Category> listC = (List<Category>) request.getAttribute("listC");
%>

<nav class="navbar navbar-expand-md top-menu">
    <div class="container">

        <ul class="navbar-nav mx-auto">

            <!-- Tất cả -->
            <li class="nav-item">
                <a class="nav-link <%= (request.getAttribute("cid") == null ? "active" : "")%>" href="Home">
                    TẤT CẢ
                </a>
            </li>

            <!-- Category -->
            <%
                Integer currentCid = (Integer) request.getAttribute("cid");
                if (listC != null) {
                    for (Category c : listC) {
            %>
            <li class="nav-item">
                <a class="nav-link <%= (currentCid != null && currentCid == c.getCid() ? "active" : "")%>" 
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
                <a class="nav-link" href="new">
                    MỚI NHẤT
                </a>
            </li>

            <!-- Best -->
            <li class="nav-item">
                <a class="nav-link" href="best">
                    BÁN CHẠY
                </a>
            </li>

        </ul>

    </div>
</nav>

<!--end of menu-->
