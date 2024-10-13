
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
                }
        %>
        <header>
            <%@include file="inc/nav.jsp" %>
        </header>
        <div class="container">
            <div class="card-header my-3">All Orders</div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Ngày</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Hủy đơn hàng</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    lichsugdsv lssv = new lichsugdsv();
                    sanphamsv spsv = new sanphamsv();
                    List<lichsugd> ds_ls = lssv.getLSGD(tk.getTentk());
                    
                    if(ds_ls != null){
                        for(lichsugd l : ds_ls){
                            DecimalFormat formatter = new DecimalFormat("#,###");
                            String t = spsv.getTenSp(l.getMasp());
                            String tt = "Đã xác nhận";
                            if(l.getTrangthai() == 1){
                                tt = "Chờ xác nhận";
                            }
                        
                    %>
                    <tr>
                        <td><%= l.getDate()%></td>
                        <td><%= t%></td>
                        <td><%=l.getSoluong()%></td>
                        <td> ${(gia>0)?formatter.format(gia):0} VND</td>
                        <td><%= tt%></td>
                        <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=l.getMals()%>">Hủy</a></td>
                    </tr>
                    <%
                        }
                    }
                    %>

                </tbody>
            </table>
        </div>

    </body>

</html>
