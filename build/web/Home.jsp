<%-- 
    Document   : Home
    Created on : 7 thg 4, 2026, 11:59:05
    Author     : THANH BINH
--%>

<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Products" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Văn phòng phẩm Long Hải Bình</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
<!--            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Home">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                                <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>-->
            <div class="container">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>

                    <div class="col-sm-9">
                        <div class="row">
                        <%
                            List<Products> listP = (List<Products>) request.getAttribute("listP");
                            if (listP != null) {
                                for (Products o : listP) {
                        %>
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card">
                                <img class="card-img-top" src="<%=o.getImage()%>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title show_txt product-title" style="font-size: 14px;
                                        display: -webkit-box;
                                        -webkit-line-clamp: 2;   /* 2 dòng */
                                        -webkit-box-orient: vertical;
                                        overflow: hidden;"><a href="detail?pid=<%=o.getId()%>" title="View Product"><%=o.getName()%></a></h4>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block"><%=o.getPrice()%>₫</p>
                                        </div>
                                        <div class="col">
                                            <a href="#" class="btn btn-success btn-block">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
