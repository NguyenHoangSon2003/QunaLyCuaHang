
package sevice;

import DAO.*;
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
}
