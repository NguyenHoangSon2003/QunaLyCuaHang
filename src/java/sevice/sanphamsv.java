
package sevice;

import DAO.*;
import java.util.ArrayList;
import java.util.List;
import model.*;


public class sanphamsv {
    private sanphamDAO spDao;
    
    public sanphamsv(){
        spDao = new sanphamDAO();
    }
    
    public List<sanpham> getAllSanPham(){
        return spDao.getAllSanPham();
    }
    
    public List<giohang> getGioHang(ArrayList<giohang> ds_gh){
        return spDao.getGioHang(ds_gh);
    }
    
    public long getTongGiaGH(ArrayList<giohang> ds_gh) {
        return spDao.getTongGiaGH(ds_gh);
    }
    
    public String getTenSp(int ma) {
        return spDao.getTenSp(ma);
    }
}
