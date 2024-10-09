package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.taikhoan;
import sevice.taikhoansv;

public class taikhoanDAO {

    public static taikhoanDAO getInstance() {
        return new taikhoanDAO();
    }

    public List<taikhoan> getAllTaiKhoan() {
        List<taikhoan> ds_taikhoan = new ArrayList<taikhoan>();
        Connection conn = JDBCConnection.getConnection();

        String sql = "Select * from taikhoan";

        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                taikhoan tk = new taikhoan(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                ds_taikhoan.add(tk);
            }
        } catch (SQLException ex) {
            Logger.getLogger(taikhoanDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        JDBCConnection.closeConnection(conn); /////////////////DONG KET NOI
        return ds_taikhoan;

    }

//    public static void main(String[] args) {
//        List<taikhoan> ds_taikhoan = new ArrayList<taikhoan>();
//        ds_taikhoan = getAllTaiKhoan();
//        for (taikhoan tk1 : ds_taikhoan) {
//            System.out.println(tk1.toString());
//        }
//    }

    public void themTaiKhoan(taikhoan tk) {
        Connection conn = JDBCConnection.getConnection();

        String sql = "INSERT INTO `taikhoan`(`tentk`, `matkhau`, `quyen`, `hoten`, `diachi`, `sdt`, `trangthai`) VALUES (?,?,?,?,?,?,'1')";
        int rs = 0;

        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, tk.getTentk());
            pst.setString(2, tk.getMatkhau());
            pst.setString(3, tk.getQuyen());
            pst.setString(4, tk.getHoten());
            pst.setString(5, tk.getDiachi());
            pst.setString(6, tk.getSdt());
            rs = pst.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(taikhoanDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        JDBCConnection.closeConnection(conn); /////////////////DONG KET NOI
    }

    public taikhoan timTK(String tentk) {
        Connection conn = JDBCConnection.getConnection();
        String sql = "SELECT * FROM `taikhoan` WHERE `taikhoan`.`tentk` = ?";

        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, tentk);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                taikhoan tk = new taikhoan(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                JDBCConnection.closeConnection(conn);
                return tk;
            } else {
                JDBCConnection.closeConnection(conn);
                return null; // Hoặc xử lý trường hợp không tìm thấy 
            }
        } catch (SQLException ex) {
            Logger.getLogger(taikhoanDAO.class.getName()).log(Level.SEVERE, null, ex);
            JDBCConnection.closeConnection(conn);
            return null; // Hoặc xử lý ngoại lệ
        }
    }
}
