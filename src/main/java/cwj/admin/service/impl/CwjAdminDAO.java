package cwj.admin.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cwj.admin.service.CwjAdminVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("cwjAdminDAO")
public class CwjAdminDAO extends EgovAbstractDAO {
	public List selectCwjAdminMenuList(CwjAdminVO cwjAdminVO) throws Exception{
		return list("cwjAdminDAO.selectCwjAdminMenuList", cwjAdminVO);
	}
	
	public void updateCwjAdminMenuList(CwjAdminVO cwjAdminVO) throws Exception{
		update("cwjAdminDAO.updateCwjAdminMenuList", cwjAdminVO);
	}
	
	public List selectCwjAdminMenuSubList(CwjAdminVO cwjAdminVO) throws Exception{
		return list("cwjAdminDAO.selectCwjAdminMenuSubList", cwjAdminVO);
	}
	
	public void updateCwjAdminMenuSubList(CwjAdminVO cwjAdminVO) throws Exception{
		insert("cwjAdminDAO.updateCwjAdminMenuSubList", cwjAdminVO);
	}
}