package funtion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.taikhoan;
import sevice.taikhoansv;

public class kiemtradn extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String tentkdn = request.getParameter("username");
            String mk = request.getParameter("password");
            taikhoansv tksv = new taikhoansv();
            List<taikhoan> ds_taikhoan = new ArrayList<taikhoan>();
            ds_taikhoan = tksv.getAllTaiKhoan();
            String errorMessage = "";
            taikhoan tk = new taikhoan();
            tk = tksv.timTK(tentkdn);
            for (taikhoan tk1 : ds_taikhoan) {
                if (tentkdn.equals(tk1.getTentk())) {
                    if(mk.equals(tk1.getMatkhau())){
                        if(tk1.getTrangthai() != 0){
                            errorMessage = "";
                            break;
                        }else{
                            errorMessage = "Tài khoản bị khóa.";
                            break;
                        }
                    }else{
                        errorMessage = "Mật khẩu không đúng.";
                        break;
                    }
                } else {
                    errorMessage = "Tên tài khoản không tồn tại.";
                }
            }
            out.print(errorMessage);

            if (!errorMessage.isEmpty()) {
                // Store form data in request attributes
                request.setAttribute("tentk", tentkdn);
                request.setAttribute("mktk", mk);
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            } else {
                HttpSession ss = request.getSession();
                ss.setMaxInactiveInterval(10000);
                String kt = "";
                try {
                    InetAddress ip = InetAddress.getLocalHost();
                    kt = ip.getHostAddress();
                } catch (UnknownHostException ex) {
                    kt = "Không thể xác định địa chỉ IP";
                }
                Date loginTime = new Date();
                ss.setAttribute("taikhoan", tk);
                ss.setAttribute("loginTime", loginTime);
                ss.setAttribute("ip", kt);
                response.sendRedirect("index.jsp");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
