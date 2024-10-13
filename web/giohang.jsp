<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<%
    DecimalFormat formatter = new DecimalFormat("#,###");
    HttpSession ss = request.getSession();
    taikhoan tk = (taikhoan) ss.getAttribute("taikhoan");
    ArrayList<giohang> ds_gh = (ArrayList<giohang>) ss.getAttribute("ds_gh");
    List<giohang> gh_sp = null;
    if (ds_gh != null) {
        sanphamsv spsv = new sanphamsv();
        gh_sp = spsv.getGioHang(ds_gh);
        long gia = spsv.getTongGiaGH(ds_gh);
        request.setAttribute("gia", gia);
        request.setAttribute("ds_gh", ds_gh);
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="inc/head.jsp" %>
        <link rel="stylesheet" href="css/giohang.css">
        <link rel="stylesheet" href="css/index.css">
        <title>Giỏ hàng</title>
    </head>

    <body>
        <!-- nav -->
        <header>
            <%@include file="inc/nav.jsp" %>
        </header>

        <!-- than -->
        <div class="container my-3">

            <div class="d-flex py-3"><h3>Tổng giá: ${(gia>0)?formatter.format(gia):0} VND </h3> <!--<a class="mx-3 btn btn-primary" href="cart-check-out">Kiểm tra lại</a>--> </div>
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
                    <%
                        if (ds_gh != null) {
                            for (giohang c : gh_sp) {
                            
                    %>
                    <tr>
                        <td><%= c.getTensp()%></td>
                        <td><%= formatter.format(c.getGia())%> VND</td>
                        <td>
                            <form action="./mua" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getMasp()%>" class="form-input">
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn bnt-sm btn-incre" href="soluong?action=inc&id=<%= c.getMasp()%>"><i class="fas fa-plus-square"></i></a> 
                                    <input type="text" name="soluong" class="form-control"  value="<%=c.getSoluongsp()%>" readonly> 
                                    <a class="btn btn-sm btn-decre" href="soluong?action=dec&id=<%= c.getMasp()%>"><i class="fas fa-minus-square"></i></a>
                                    <button type="submit" class="btn btn-primary btn-sm ">Mua</button>
                                </div>
                            </form>
                        </td>
                        <td><a href="xoa_spgh?id=<%= c.getMasp()%>" class="btn btn-sm btn-danger">Xóa</a></td>
                    </tr>
                    <%
                        }}%>
                </tbody>
            </table>
        </div>
        <script src="js/giohang.js"></script>
    </body>

</html>
