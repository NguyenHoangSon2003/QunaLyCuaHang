<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat, model.taikhoan" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <%@include file="inc/head.jsp" %>
        <title>Trang Chủ</title>
        <link rel="stylesheet" href="css/index.css">
    </head>

    <body>
        <%
            HttpSession ss = request.getSession();
            taikhoan tk = new taikhoan();
            tk = (taikhoan) ss.getAttribute("taikhoan");
            if (tk != null){
            ss.setAttribute("taikhoan", tk);
            String ip = (String) ss.getAttribute("ip");
            Date loginTime = (Date) session.getAttribute("loginTime");
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String formattedTime = formatter.format(loginTime);
            }
        %>
        <header>
            <nav>
                <ul class="dieuhuong">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="sanpham.jsp">Sản phẩm</a></li>
                    <%
                        if(tk != null){
                    %>
                    <li><a href="giohang.jsp">Giỏ hàng</a></li>
                    <li><a href="lichsugd.jsp">Lịch sử giao dịch</a></li>
                    <%
                        }
                    %>
                </ul>
            </nav>
            <div class="profile">
                <%
                     if(tk == null){
                %>
                <nav>
                    <ul>
                        <li><a href="#">Hồ sơ</a></li>
                        <li><a href="dangnhap.jsp">Đăng nhập</a></li>
                    </ul>
                </nav>
                <%
                    }else{
                %>
                <nav>
                    <ul>
                        <li><a href="#">Hồ sơ</a></li>
                        <li><a href="dx">Đăng xuất</a></li>
                    </ul>
                </nav>
                <%
                    }
                %>
            </div>
        </header>

        <div>
            <section>
                <img src="img/trangchu.png" alt="" width="100%">
            </section>
        </div>


    </body>
    <footer>
    </footer>

</html>
