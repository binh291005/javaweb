<%--
    Document   : Left
    Created on : 10 thg 4, 2026, 11:12:56
    Author     : THANH BINH
--%>

<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> DANH MỤC </div>
        <ul class="list-group category_block">
            <%
                List<Category> listC = (List<Category>) request.getAttribute("listC");
                if (listC != null) {
                    for (Category o : listC) {
            %>
            <li class="list-group-item text-white"><a href="category?cid=<%=o.getCid()%>"><%=o.getCname()%></a></li>
                <%
                        }
                    }
                %>
        </ul>
    </div>

    <%
        Products p = (Products) request.getAttribute("p");
    %>

    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">
            SẢN PHẨM MỚI NHẤT
        </div>

        <div class="card-body text-center">
            <% if (p != null) {%>
            <img class="img-fluid" src="<%=p.getImage()%>" />
            <h5><%=p.getName()%></h5>
            <p class="text-danger"><%=p.getPrice()%>₫</p>
            <% } else { %>
            <p>Không có sản phẩm</p>
            <% }%>
        </div>
    </div>

</div>