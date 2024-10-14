<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

