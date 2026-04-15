<%-- 
    Document   : Signup
    Created on : 12 thg 4, 2026, 00:22:42
    Author     : THANH BINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body{
            background-color: #f2f2f2;
        }

        .signup-box{
            width: 400px;
            margin: 80px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>

<div class="signup-box">

    <h3 style="text-align:center">ĐĂNG KÝ</h3>

    <form action="signup" method="post">
        <p class="text-danger" align="center">${mess}</p>
        <input name="useraccount" class="form-control mb-2" placeholder="Tên tài khoản" required>
        <input name="username" class="form-control mb-2" placeholder="Tên đăng nhập" required>
        <input name="email" class="form-control mb-2" placeholder="Email" required>
        <input name="phone" class="form-control mb-2" placeholder="Số Điện thoại">
        <input name="address" class="form-control mb-2" placeholder="Địa chỉ">
        <input name="pass" type="password" class="form-control mb-2" placeholder="Mật khẩu" required>
        <input name="repass" type="password" class="form-control mb-2" placeholder="Nhập lại mật khẩu" required>

        <button class="btn btn-primary btn-block">Sign up</button>

        <a href="Login.jsp">← Quay lại đăng nhập</a>
    </form>

</div>

</body>
</html>

