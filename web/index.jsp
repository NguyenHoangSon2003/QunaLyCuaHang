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
            <%@include file="inc/nav.jsp" %>
        </header>

        <div>
            <section>
                <img src="img/trangchu.png" alt="" width="100%">
                <img src="img/logo1.png" alt="" width="100%">
            </section>
        </div>


    </body>
    <footer>
        <%@include file="inc/footer.jsp" %>
    </footer>

</html>
