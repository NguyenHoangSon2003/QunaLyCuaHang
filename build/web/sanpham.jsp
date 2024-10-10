
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
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
            ArrayList<giohang> ds_gh = (ArrayList<giohang>) ss.getAttribute("ds_gh");
            List<giohang> gh_sp = null;
            if (ds_gh != null) {
                sanphamsv spsv = new sanphamsv();
                gh_sp = spsv.getGioHang(ds_gh);
                long gia = spsv.getTongGiaGH(ds_gh);
                request.setAttribute("gia", gia);
                request.setAttribute("ds_gh", ds_gh);
            }
            }
        %>
        <header>
            <%@include file="inc/nav.jsp" %>
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
                        DecimalFormat formatter = new DecimalFormat("#,###");
                %>  
                <div class="col-md-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img src="img/<%= sp.getAnh() %>" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><%= sp.getTensp() %></h5>
                            <h6 class="price">Bộ nhớ: <%= sp.getRam()%>GB/<%= sp.getRom()%>GB </h6>
                            <h6 class="price">Pin: <%= sp.getPin() %> mAh</h6>
                            <h6 class="price">Màn hình: <%= sp.getManhinh() %> Inch</h6>
                            <h6 class="price">Giá: <%= formatter.format(sp.getGia()) %> VND</h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="./add_to_card?id=<%= sp.getMasp()%>" class="btn btn-dark">Thêm vào giỏ hàng</a>
                                <a href="./add_to_card" class="btn btn-primary">Mua Ngay</a>
                            </div>
                            <h5 style='color:crimson; text-align: center'></h5>

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