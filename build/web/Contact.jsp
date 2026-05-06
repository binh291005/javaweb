<%-- 
    Document   : Contact.jsp
    Created on : May 5, 2026, 8:33:06 AM
    Author     : THANH BINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liên hệ</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <style>
            body {
                background: #f5f5f5;
            }

            .contact-container {
                margin-top: 40px;
            }

            .contact-box {
                background: #fff;
                border-radius: 10px;
                padding: 25px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .title {
                color: #ee4d2d; /* màu Shopee */
                font-weight: bold;
                margin-bottom: 20px;
            }

            .info-box {
                border-right: 1px solid #eee;
            }

            .info-item {
                margin-bottom: 15px;
            }

            .info-item i {
                color: #ee4d2d;
                margin-right: 10px;
            }

            .btn-shopee {
                background: #ee4d2d;
                color: #fff;
                font-weight: 600;
            }

            .btn-shopee:hover {
                background: #d73211;
            }

            textarea {
                resize: none;
            }

            @media (max-width: 768px) {
                .info-box {
                    border-right: none;
                    border-bottom: 1px solid #eee;
                    margin-bottom: 20px;
                    padding-bottom: 20px;
                }
            }
        </style>
    </head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <body>
        <jsp:include page="Menu.jsp"/>

        <div class="container contact-container">
            <div class="row contact-box">

                <!-- 🔻 BÊN TRÁI: INFO -->
                <div class="col-md-5 info-box">
                    <h4 class="title">📞 Thông tin liên hệ</h4>

                    <div class="info-item">
                        <i class="fa fa-map-marker"></i> Hà Nội, Việt Nam
                    </div>

                    <div class="info-item">
                        <i class="fa fa-phone"></i> 0973 047 453
                    </div>

                    <div class="info-item">
                        <i class="fa fa-envelope"></i> binh279205@gmail.com
                    </div>

                    <hr>

                    <p>
                        Nếu bạn có bất kỳ câu hỏi hoặc góp ý nào, hãy gửi cho chúng tôi.
                        Chúng tôi sẽ phản hồi sớm nhất!
                    </p>
                </div>

                <!-- 🔻 BÊN PHẢI: FORM -->
                <div class="col-md-7">
                    <h4 class="title">✉️ Gửi liên hệ</h4>

                    <form action="contact" method="post">

                        <input type="text" name="name" class="form-control mb-3" placeholder="Họ tên">

                        <input type="email" name="email" class="form-control mb-3" placeholder="Email">

                        <textarea name="message" rows="5" class="form-control mb-3"
                                  placeholder="Nhập nội dung..."></textarea>

                        <button class="btn btn-shopee btn-block">Gửi ngay</button>
                    </form>

                    <!-- 🔥 THÔNG BÁO -->
                    <%
                        String msg = request.getParameter("msg");
                        if (msg != null) {
                    %>
                    <script>
                        document.addEventListener("DOMContentLoaded", function () {
                        <% if ("success".equals(msg)) { %>
                            Swal.fire({
                                icon: 'success',
                                title: 'Thành công',
                                text: 'Gửi liên hệ thành công!'
                            });
                        <% } else if ("missing".equals(msg)) { %>
                            Swal.fire({
                                icon: 'warning',
                                title: 'Thiếu thông tin',
                                text: 'Vui lòng nhập đầy đủ!'
                            });
                        <% } else if ("error".equals(msg)) { %>
                            Swal.fire({
                                icon: 'error',
                                title: 'Lỗi',
                                text: 'Có lỗi xảy ra!'
                            });
                        <% } %>

                            // 👉 Xóa msg khỏi URL (rất quan trọng)
                            if (window.history.replaceState) {
                                const url = new URL(window.location);
                                url.searchParams.delete("msg");
                                window.history.replaceState({}, document.title, url);
                            }
                        });
                    </script>
                    <%
                        }
                    %>

                </div>

            </div>
        </div>

        <jsp:include page="Footer.jsp"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </body>
</html>
