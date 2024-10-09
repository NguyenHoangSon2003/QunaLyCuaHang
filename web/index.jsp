<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
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
            <nav>
                <ul class="dieuhuong">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="sanpham.jsp">Sản phẩm</a></li>
                    <%
                        if(tk != null){
                    %>
                    <li><a href="giohang.jsp">Giỏ hàng<span class="badge badge-danger text-danger">${ds_gh.size()}</span></a></li>
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
