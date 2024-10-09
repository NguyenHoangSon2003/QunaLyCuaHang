<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.util.List" %>
<%
    HttpSession ss = request.getSession();
    taikhoan tkss = (taikhoan) ss.getAttribute("taikhoan");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="inc/head.jsp" %>
        <link rel="stylesheet" href="css/giohang.css">
        <link rel="stylesheet" href="css/index.css">
        <title>Giỏ hàng</title>
        <style type="text/css">
            .table tbody td{
                vertical-align: middle;
            }
            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size: 25px;
            }
        </style>
    </head>

    <body>
        <!-- nav -->
        <header>
            <nav>
                <ul class="dieuhuong">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="sanpham.jsp">Sản phẩm</a></li>
                    <li><a href="giohang.jsp">Giỏ hàng</a></li>
                    <li><a href="lichsugd.jsp">Lịch sử giao dịch</a></li>
                </ul>
            </nav>
            <div class="search-container">
                <input type="text" placeholder="Tìm kiếm...">
                <button type="submit">Tìm</button>
            </div>
            <div class="profile">
                <nav>
                    <ul>
                        <li><a href="#">Hồ sơ</a></li>
                        <li><a href="dangnhap.jsp">Đăng xuất</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- than -->
        <div class="container my-3">
            <div class="d-flex py-3"><h3>Tổng giá: ${(total>0)?dcf.format(total):0} VND </h3> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Tên</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Mua ngay</th>
                        <th scope="col">Hủy</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Laptop1</td>
                        <td>1.000.000</td>
                        <td>
                            <form action="order-now" method="post" class="form-inline">
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn bnt-sm btn-incre" href="#"><i class="fas fa-plus-square"></i></a> 
                                    <input type="text" name="quantity" class="form-control"  value="1" readonly> 
                                    <a class="btn btn-sm btn-decre" href="#"><i class="fas fa-minus-square"></i></a>
                                </div>
<!--                                <button type="submit" class="btn btn-primary btn-sm">Buy</button>-->
                            </form>
                        </td>
                        <td><a href="#" class="btn btn-sm btn-danger">Xóa</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <script src="js/giohang.js"></script>
    </body>

</html>
