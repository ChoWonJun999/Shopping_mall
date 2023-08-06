package cwj.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cwj.admin.service.CwjAdminService;
import cwj.admin.service.CwjAdminVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.com.utl.fcc.service.EgovStringUtil;

@Service("cwjAdminService")
public class CwjAdminServiceImpl extends EgovAbstractServiceImpl implements CwjAdminService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CwjAdminServiceImpl.class);
	
	/** CwjAdminDAO */
	@Resource(name = "cwjAdminDAO")
	private CwjAdminDAO cwjAdminDAO;
	
	public List selectCwjAdminMenuList(CwjAdminVO cwjAdminVO) throws Exception{
		return cwjAdminDAO.selectCwjAdminMenuList(cwjAdminVO);
	}
	
	public void updateCwjAdminMenuList(CwjAdminVO cwjAdminVO) throws Exception{
		String[] aMenuKeyList				= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuKey()), ",");
		String[] aMenuNumberList			= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuNumber()), ",");
		String[] aMenuNameList				= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuName()), ",");
		String[] aMenuVisibleStateList		= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuVisibleState()), ",");
		
		for(int i=0; i<aMenuKeyList.length; i++){
			CwjAdminVO vo = new CwjAdminVO();
			vo.setaMenuKey(aMenuKeyList[i]);
			vo.setaMenuNumber(aMenuNumberList[i]);
			vo.setaMenuName(aMenuNameList[i]);
			vo.setaMenuVisibleState(aMenuVisibleStateList[i]);
			if(aMenuNameList[i].equals("")) vo.setaMenuVisibleState("0");
			cwjAdminDAO.updateCwjAdminMenuList(vo);
		}
		
		String[] aMenuKeyTempList				= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuKeyTemp()), ",");
		String[] aMenuSubKeyList				= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuSubKey()), ",");
		String[] aMenuSubNumberList				= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuSubNumber()), ",");
		String[] aMenuSubNameList				= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuSubName()), ",");
		String[] aMenuSubVisibleStateList		= EgovStringUtil.split(String.valueOf(cwjAdminVO.getaMenuSubVisibleState()), ",");
		
		for(int i=0; i<aMenuKeyTempList.length; i++){
			CwjAdminVO vo = new CwjAdminVO();
			vo.setaMenuKey(aMenuKeyTempList[i]);
			if(Integer.valueOf(aMenuSubKeyList[i]) != -1) vo.setaMenuSubKey(aMenuSubKeyList[i]);
			System.out.println(vo.getaMenuSubKey());
			vo.setaMenuSubNumber(aMenuSubNumberList[i]);
			vo.setaMenuSubName(aMenuSubNameList[i]);
			vo.setaMenuSubVisibleState(aMenuSubVisibleStateList[i]);
			if(aMenuSubNameList[i].equals("")) vo.setaMenuSubVisibleState("0");
			cwjAdminDAO.updateCwjAdminMenuSubList(vo);
		}
		System.out.println("updateCwjAdminMenuSubList end");
	}
	
	public List selectCwjAdminMenuSubList(CwjAdminVO cwjAdminVO) throws Exception{
		return cwjAdminDAO.selectCwjAdminMenuSubList(cwjAdminVO);
	}
}