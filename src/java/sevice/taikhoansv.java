
package sevice;

import DAO.taikhoanDAO;
import java.util.List;
import model.taikhoan;


public class taikhoansv {
    private taikhoanDAO tkDao;
    
    public taikhoansv(){
        tkDao = new taikhoanDAO();
    }
    
    public List<taikhoan> getAllTaiKhoan(){
        return tkDao.getAllTaiKhoan();
    }
    
    public void themTaiKhoan (taikhoan tk){
        tkDao.themTaiKhoan(tk);
    }
    
    public taikhoan timTK (String tentk){
        return tkDao.timTK(tentk);
    }
    
}
