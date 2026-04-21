<%-- 
    Document   : Detail
    Created on : 10 thg 4, 2026, 10:03:39
    Author     : THANH BINH
--%>

<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                background: #f5f9ff;
            }

            /* Card chính */
            .product-card {
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 8px 25px rgba(0, 123, 255, 0.15);
                background: #fff;
            }

            /* Ảnh sản phẩm */
            .product-image {
                padding: 20px;
                background: #f0f6ff;
                text-align: center;
            }

            .product-image img {
                width: 80%;
                max-height: 420px;
                object-fit: contain;
                transition: 0.3s;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .product-image img:hover {
                transform: scale(1.08);
            }

            /* Tiêu đề */
            .product-title {
                font-size: 26px;
                font-weight: 600;
                color: #003366;
            }

            /* Giá */
            .product-price {
                font-size: 32px;
                font-weight: bold;
                color: #007bff;
            }

            /* Description */
            .product-desc {
                color: #555;
                line-height: 1.6;
            }

            /* Select số lượng */
            .quantity-box select {
                border-radius: 8px;
                border: 1px solid #007bff;
            }

            /* Button */
            .btn-buy {
                background: linear-gradient(45deg, #007bff, #00c6ff);
                border: none;
                border-radius: 8px;
                padding: 12px 25px;
                font-weight: bold;
                color: #fff !important;
            }

            .btn-buy:hover {
                opacity: 0.9;
            }

            .btn-cart {
                border: 2px solid #007bff;
                color: #007bff;
                border-radius: 8px;
                padding: 12px 25px;
                font-weight: bold;
            }

            .btn-cart:hover {
                background: #007bff;
                color: #fff;
            }

            /* Badge */
            .badge-stock {
                background: #28a745;
                color: #fff;
                padding: 5px 10px;
                border-radius: 20px;
                font-size: 12px;
            }

            /* Responsive spacing */
            .product-info {
                padding: 30px;
            }

            .btn-primary {
                background: #007bff;
                border: none;
                font-weight: 600;
                color: #fff;
            }

            .btn-primary:hover {
                background: #0056b3;
                color: #fff;
            }

            .btn-outline-primary {
                border: 2px solid #007bff;
                color: #007bff;
                font-weight: 600;
            }

            .btn-outline-primary:hover {
                background: #007bff;
                color: #fff;
            }
            /* Title */
            .desc-title {
                font-weight: 700;
                color: #003366;
                margin-bottom: 15px;
            }

            /* Box mô tả */
            .product-desc-box {
                background: #f9fbff;
                border-left: 4px solid #007bff;
                padding: 15px 20px;
                border-radius: 8px;
            }

            /* Nội dung */
            .product-desc-box p {
                margin: 0;
                color: #444;
                line-height: 1.7;
                text-align: justify;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>
                <%
                    Products detail = (Products) request.getAttribute("detail");
                %>
                <div class="col-sm-9">
                    <div class="product-card">
                        <div class="row no-gutters">

                            <!-- ẢNH -->
                            <div class="col-md-5 product-image">
                                <img src="<%=detail.getImage()%>" alt="product">
                            </div>

                            <!-- THÔNG TIN -->
                            <div class="col-md-7 product-info">
                                <h2 class="product-title"><%=detail.getName()%></h2>

                                <% if (detail.getQuantity() > 0) {%>
                                <span class="badge-stock">Còn hàng (<%=detail.getQuantity()%>)</span>
                                <% } else { %>
                                <span class="badge badge-danger">Hết hàng</span>
                                <% }%>

                                <p class="product-price mt-3"><%=detail.getPrice()%>₫</p>

                                <hr>

                                <h5 class="desc-title">Mô tả sản phẩm</h5>

                                <div class="product-desc-box">
                                    <p><%=detail.getDescription()%></p>
                                </div>

                                <hr>

                                <!-- Quantity -->
                                <div class="d-flex align-items-center">
                                    <button class="btn btn-outline-secondary" onclick="decrease()">-</button>
                                    <input id="qty" type="number" value="1" min="1" max="<%=detail.getQuantity()%>"
                                           class="form-control text-center mx-2" style="width:60px;">
                                    <button class="btn btn-outline-secondary" onclick="increase()">+</button>
                                </div>

                                <script>
                                    function increase() {
                                        let qty = document.getElementById("qty");
                                        let max = <%=detail.getQuantity()%>;
                                        if (parseInt(qty.value) < max) {
                                            qty.value = parseInt(qty.value) + 1;
                                        }
                                    }

                                    function decrease() {
                                        let qty = document.getElementById("qty");
                                        if (qty.value > 1) {
                                            qty.value--;
                                        }
                                    }
                                </script>

                                <!-- BUTTON -->
                                <div class="mt-4">
                                    <% if (detail.getQuantity() > 0) { %>
                                    <button class="btn btn-buy mr-2">MUA NGAY</button>
                                    <button class="btn btn-cart">THÊM VÀO GIỎ</button>
                                    <% } else { %>
                                    <button class="btn btn-secondary mr-2" disabled>HẾT HÀNG</button>
                                    <% }%>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
