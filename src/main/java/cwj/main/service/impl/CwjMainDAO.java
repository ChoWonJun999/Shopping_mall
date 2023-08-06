package cwj.main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cwj.main.service.CwjMainVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("cwjMainDAO")
public class CwjMainDAO extends EgovAbstractDAO {
	public List selectCwjMainMenuList(CwjMainVO cwjMainVO) throws Exception{
		return list("cwjMainDAO.selectCwjMainMenuList", cwjMainVO);
	}
}