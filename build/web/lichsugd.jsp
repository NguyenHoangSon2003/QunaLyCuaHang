
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.util.*, 
         java.text.SimpleDateFormat, 
         model.*, 
         sevice.*,
         java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/index.css">
        <title>Document</title>
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

    </body>

</html>
