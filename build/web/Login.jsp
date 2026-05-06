<%-- 
    Document   : Login
    Created on : 8 thg 4, 2026, 10:41:43
    Author     : THANH BINH
--%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            body{
                background-color: #f2f2f2;
            }

            .login-box{
                width: 350px;
                margin: 100px auto;
                padding: 20px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.2);
            }

            .login-box h3{
                text-align: center;
                margin-bottom: 20px;
            }
            .back-link{
                display: block;
                margin-top: 10px;
                text-align: left;
            }
        </style>
    </head>

    <body>

        <div class="login-box">

            <h3>ĐĂNG NHẬP</h3>

            <!-- HIỂN THỊ LỖI -->
            <p class="text-danger" align="center">${mess}</p>

            <form action="login" method="post">
                <input name="user" type="text" value="${user}" class="form-control mb-2" placeholder="Tên đăng nhập" required>
                <input name="pass" type="password" class="form-control mb-2" placeholder="Mật khẩu" required>

                <div class="form-check mb-2">
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">Nhớ mật khẩu</label>
                </div>

                <button class="btn btn-success w-100">Đăng nhập</button>

                <button type="button" onclick="showSignup()" class="btn btn-primary btn-block mt-2">
                    Đăng ký tài khoản mới
                </button>
                <a href="Home" class="back-link">← Quay lại</a>
            </form>


        </div>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script>
                    function showSignup() {
                        window.location.href = "Signup.jsp";
                    }
        </script>

    </body>
</html>

