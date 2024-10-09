
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.util.List" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="inc/head.jsp" %>
        <link rel="stylesheet" href="css/index.css">
        <title>Sản phẩm</title>
    </head>

    <body>
        <%
            HttpSession ss = request.getSession();
            taikhoan tk = new taikhoan();
            tk = (taikhoan) ss.getAttribute("taikhoan");
            if (tk != null){
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
        
        <div class="container">
            <div class="card-header my-3">Tất cả sản phẩm </div>
            <hr class="border border-danger border-2 opacity-50">
            <div class="row row-cols-1 row-cols-md-4 g-4">
                <%
                    sanphamsv spsv = new sanphamsv();
                    List<sanpham> ds_sp = spsv.getAllSanPham();
                    if( !ds_sp.isEmpty()){
                        for(sanpham sp : ds_sp){
                %>  
                <div class="col-md-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img src="img/<%= sp.getAnh() %>" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><%= sp.getTensp() %></h5>
                            <h6 class="price">Bộ nhớ: <%= sp.getRam()%>GB/<%= sp.getRom()%>GB </h6>
                            <h6 class="price">Pin: <%= sp.getPin() %></h6>
                            <h6 class="price">Màn hình: <%= sp.getManhinh() %></h6>
                            <h6 class="price">Giá: <%= sp.getGia() %></h6>
                            <h6 class="price">SL: <%= sp.getSoluong() %></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="./add_to_card" class="btn btn-dark">Thêm vào giỏ hàng</a>
                                <a href="./add_to_card" class="btn btn-primary">Mua Ngay</a>
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
    </body>

</html>