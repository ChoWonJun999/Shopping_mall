package cwj.admin.service;

import java.util.List;

public interface CwjAdminService {
	public List selectCwjAdminMenuList(CwjAdminVO cwjAdminVO) throws Exception;
	public void updateCwjAdminMenuList(CwjAdminVO cwjAdminVO) throws Exception;
	
	public List selectCwjAdminMenuSubList(CwjAdminVO cwjAdminVO) throws Exception;
}