package cwj.main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cwj.main.service.CwjMainService;
import cwj.main.service.CwjMainVO;

@Controller
public class CwjMainController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CwjMainController.class);
	
	@Resource(name = "cwjMainService")
	private CwjMainService cwjMainService;
	
	@RequestMapping(value = "/main.do") 
	public String mainPage(HttpServletRequest request
			, @ModelAttribute("cwjMainVO") CwjMainVO cwjMainVO
			, ModelMap model) throws Exception{
		
		List configList = cwjMainService.selectCwjMainMenuList(cwjMainVO);
		model.addAttribute("configList", configList);
		
//		System.out.println("main");
		return "main/main.tiles";
	}
	
	@RequestMapping(value = "/menu_page1_lf.do") 
	public String mainMenuPage1Lf(HttpServletRequest request
			, @ModelAttribute("cwjMainVO") CwjMainVO cwjMainVO
			, ModelMap model) throws Exception{
		
		List configList = cwjMainService.selectCwjMainMenuList(cwjMainVO);
		model.addAttribute("configList", configList);
		
		return "main/menu_page1_lf.tiles";
	}
	
	@RequestMapping(value = "/menu_page2_lf.do") 
	public String mainMenuPage2Lf(HttpServletRequest request
			, @ModelAttribute("cwjMainVO") CwjMainVO cwjMainVO
			, ModelMap model) throws Exception{
		
		List configList = cwjMainService.selectCwjMainMenuList(cwjMainVO);
		model.addAttribute("configList", configList);
		
		return "main/menu_page2_lf.tiles";
	}
	
	@RequestMapping(value = "/menu_page3_lf.do") 
	public String mainMenuPage3Lf(HttpServletRequest request
			, @ModelAttribute("cwjMainVO") CwjMainVO cwjMainVO
			, ModelMap model) throws Exception{
		
		List configList = cwjMainService.selectCwjMainMenuList(cwjMainVO);
		model.addAttribute("configList", configList);
		
		return "main/menu_page3_lf.tiles";
	}
	
	@RequestMapping(value = "/menu_page4_lf.do") 
	public String mainMenuPage4Lf(HttpServletRequest request
			, @ModelAttribute("cwjMainVO") CwjMainVO cwjMainVO
			, ModelMap model) throws Exception{
		
		List configList = cwjMainService.selectCwjMainMenuList(cwjMainVO);
		model.addAttribute("configList", configList);
		
		return "main/menu_page4_lf.tiles";
	}
}