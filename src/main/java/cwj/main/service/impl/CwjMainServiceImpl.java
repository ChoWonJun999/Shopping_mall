package cwj.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cwj.main.service.CwjMainService;
import cwj.main.service.CwjMainVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("cwjMainService")
public class CwjMainServiceImpl extends EgovAbstractServiceImpl implements CwjMainService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CwjMainServiceImpl.class);
	
	/** CwjMainDAO */
	@Resource(name = "cwjMainDAO")
	private CwjMainDAO cwjMainDAO;
	
	public List selectCwjMainMenuList(CwjMainVO cwjMainVO) throws Exception{
		return cwjMainDAO.selectCwjMainMenuList(cwjMainVO);
	}
}