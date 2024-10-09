/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package funtion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import model.giohang;
import model.taikhoan;

public class themspmua extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ss = request.getSession();
            taikhoan tk = (taikhoan) ss.getAttribute("taikhoan");
            if (tk == null) {
                response.sendRedirect("dangnhap.jsp");
            } else {
                ArrayList<giohang> ds_gh = new ArrayList<>();
                int id = Integer.parseInt(request.getParameter("id"));
                giohang gh = new giohang();
                gh.setMasp(id);
                gh.setSoluongsp(1);

                ArrayList<giohang> ds_ght = (ArrayList<giohang>) ss.getAttribute("ds_gh");
                if (ds_ght == null) {
                    ds_gh.add(gh);
                    ss.setAttribute("ds_gh", ds_gh);
                    response.sendRedirect("sanpham.jsp");
                } else {
                    ds_gh = ds_ght;
                    boolean exist = false;
                    for (giohang gh1 : ds_ght) {
                        if (gh1.getMasp() == id) {
                            exist = true;
                            out.println("<h3 style='color:crimson; text-align: center'>Sản phẩm đã có trong giỏ hàng. <a href='giohang.jsp'>Đi tới trang giỏ hàng</a></h3>");
                        }
                    }
                    if (!exist) {
                        ds_gh.add(gh);
                        response.sendRedirect("sanpham.jsp");
                    }
                }
            }
        }
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
