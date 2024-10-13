package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

public class sanphamDAO {

    public static sanphamDAO getInstance() {
        return new sanphamDAO();
    }

    public List<sanpham> getAllSanPham() {
        List<sanpham> ds_sanpham = new ArrayList<sanpham>();
        Connection conn = JDBCConnection.getConnection();

        String sql = "Select * from sanpham";

        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                sanpham sp = new sanpham(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4),
                        rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8));
                ds_sanpham.add(sp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(sanphamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        JDBCConnection.closeConnection(conn);
        return ds_sanpham;

    }

    public List<giohang> getGioHang(ArrayList<giohang> ds_gh) {
        Connection conn = JDBCConnection.getConnection();
        List<giohang> book = new ArrayList<giohang>();
        try {
            if (ds_gh.size() > 0) {
                for (giohang gh : ds_gh) {
                    String sql = "Select * from sanpham where masp =?";
                    PreparedStatement pst = conn.prepareStatement(sql);
                    pst.setInt(1, gh.getMasp());
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        giohang row = new giohang();
                        row.setMasp(rs.getInt(1));
                        row.setTensp(rs.getString(2));
                        row.setRam(rs.getInt(3));
                        row.setRom(rs.getInt(4));
                        row.setPin(rs.getInt(5));
                        row.setManhinh(rs.getDouble(6));
                        row.setGia(rs.getLong(8) * gh.getSoluongsp());
                        row.setSoluongsp(gh.getSoluongsp());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

    public long getTongGiaGH(ArrayList<giohang> ds_gh) {
        Connection conn = JDBCConnection.getConnection();
        long sum = 0;
        try {
            if (ds_gh.size() > 0) {
                for (giohang item : ds_gh) {
                    String sql = "Select gia from sanpham where masp =?";
                    PreparedStatement pst = conn.prepareStatement(sql);
                    pst.setInt(1, item.getMasp());
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getLong("gia") * item.getSoluongsp();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    public String getTenSp(int ma) {
        Connection conn = JDBCConnection.getConnection();
        String s = "null";
        try {
            String sql = "Select tensp from sanpham where masp =?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, ma);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                s = rs.getString("tensp");
                JDBCConnection.closeConnection(conn);
                return s;
            } else {
                JDBCConnection.closeConnection(conn);
                return s;
            }
        }
        catch (SQLException e) {
                e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return s ;
}

//    public static void main(String[] args) {
//        List<sanpham> ds_sp = getAllSanPham();
//        for(sanpham sp : ds_sp){
//            System.out.println(sp.toString());
//        }
//    }
//    public void themSanPham(sanpham t) {
//
//        try {
//            Connection conn = JDBCConnection.getConnection();
//
//            String sql = "INSERT INTO `sanpham`(`masp`, `tensp`, `maxuatxu`, `chipxuly`, `dungluongpin`, `kichthuocman`, `mahedieuhanh`, `phienbanhdh`, `camerasau`, `cameratruoc`, `thoigianbaohanh`, `mathuonghieu`, `soluongton`) VALUES (NULL, ?,?,?,?,?,?,?,?,?,?,?,?)";
//
//            PreparedStatement pst = conn.prepareStatement(sql);
//            
//            pst.setString(1, t.getTensp());
//            pst.setInt(2, t.getMaxuatxu());
//            pst.setString(3, t.getChipxuly());
//            pst.setInt(4, t.getDungluongpin());
//            pst.setDouble(5, t.getKichthuocman());
//            pst.setInt(6, t.getMahdh());
//            pst.setInt(7, t.getPhienbanhdh());
//            pst.setString(8, t.getCamerasau());
//            pst.setString(9, t.getCameratruoc());
//            pst.setInt(10, t.getThoigianbaohanh());
//            pst.setInt(11, t.getMathuonghieu());
//            pst.setInt(12, t.getSoluongton());
//
//            int rs = pst.executeUpdate();
//            JDBCConnection.closeConnection(conn);
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//    }
//
//    public void suaSanPham(sanpham t) {
//
//        try {
//            Connection conn = JDBCConnection.getConnection();
//            String sql = "UPDATE `sanpham` SET `tensp`=?,`maxuatxu`=?,`chipxuly`=?,`dungluongpin`=?,`kichthuocman`=?,`mahedieuhanh`=?,`phienbanhdh`=?,`camerasau`=?,`cameratruoc`=?,`thoigianbaohanh`=?,`mathuonghieu`=?,`soluongton`=? WHERE `sanpham`.`masp`=?";
//            PreparedStatement pst = conn.prepareStatement(sql);
//            pst.setString(1, t.getTensp());
//            pst.setInt(2, t.getMaxuatxu());
//            pst.setString(3, t.getChipxuly());
//            pst.setInt(4, t.getDungluongpin());
//            pst.setDouble(5, t.getKichthuocman());
//            pst.setInt(6, t.getMahdh());
//            pst.setInt(7, t.getPhienbanhdh());
//            pst.setString(8, t.getCamerasau());
//            pst.setString(9, t.getCameratruoc());
//            pst.setInt(10, t.getThoigianbaohanh());
//            pst.setInt(11, t.getMathuonghieu());
//            pst.setInt(12, t.getSoluongton());
//            pst.setInt(13, t.getMasp());
//            int rs = pst.executeUpdate();
//            JDBCConnection.closeConnection(conn);
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//
//    }
//
//    public void xoaSanPham(int masp) {
//        int result = 0;
//        try {
//            Connection con = (Connection) JDBCConnection.getConnection();
//            String sql = "DELETE FROM sanpham WHERE `sanpham`.`masp` = ?";
//            PreparedStatement pst = (PreparedStatement) con.prepareStatement(sql);
//            pst.setInt(1, masp);
//            result = pst.executeUpdate();
//            JDBCConnection.closeConnection(con);
//        } catch (SQLException ex) {
//            Logger.getLogger(nhanvien.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//    
//    public xuatxu timXX(sanpham sp){
//        xuatxu xx = new xuatxu();
//        Connection conn = JDBCConnection.getConnection();
//        String sql = "SELECT * FROM `xuatxu` WHERE `maxuatxu` = ?"; 
//        try {
//            PreparedStatement pst = conn.prepareStatement(sql);
//            pst.setInt(1, sp.getMaxuatxu()); // Đặt giá trị cho tham số
//            ResultSet rs = pst.executeQuery();
//            if (rs.next()) {
//                // Nếu tìm thấy kết quả, xử lý để lấy thông tin tài khoản vào đối tượng tk
//                xx.setMaxuatxu(rs.getInt("maxuatxu"));
//                xx.setTenxuatxu(rs.getString("tenxuatxu"));
//                sp.setXx(xx);
//                JDBCConnection.closeConnection(conn);
//                return xx;
//            } else {
//                JDBCConnection.closeConnection(conn);
//                return xx;
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(taikhoanDAO.class.getName()).log(Level.SEVERE, null, ex);
//            JDBCConnection.closeConnection(conn);
//            return xx;
//        }   
//    }
}
