package cwj.admin.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cwj.admin.service.CwjAdminService;
import cwj.admin.service.CwjAdminVO;

@Controller
public class CwjAdminController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CwjAdminController.class);
	
	@Resource(name = "cwjAdminService")
	private CwjAdminService cwjAdminService;
	
	@RequestMapping(value = "/admin.do") 
	public String adminPage(HttpServletRequest request
			, @ModelAttribute("cwjAdminVO") CwjAdminVO cwjAdminVO
			, ModelMap model) throws Exception{
		
		System.out.println("admin");
//		return "admin/admin.tiles";
		return "redirect:/make_menu_lf.do";
	}
	
	@RequestMapping(value = "/make_menu_lf.do") 
	public String makeMenuLp(HttpServletRequest request
			, @ModelAttribute("cwjAdminVO") CwjAdminVO cwjAdminVO
			, ModelMap model) throws Exception{
		
		List list = cwjAdminService.selectCwjAdminMenuList(cwjAdminVO);
		model.addAttribute("list", list);
		List subList = cwjAdminService.selectCwjAdminMenuSubList(cwjAdminVO);
		model.addAttribute("subList", subList);
		
		return "admin/make_menu_lf.tiles";
	}
	
	@RequestMapping(value = "/make_menu_u.do") 
	public String makeMenuU(HttpServletRequest request
			, @ModelAttribute("cwjAdminVO") CwjAdminVO cwjAdminVO
			, ModelMap model) throws Exception{
		
		System.out.println(cwjAdminVO);
		cwjAdminService.updateCwjAdminMenuList(cwjAdminVO);
		
		return "redirect:/make_menu_lf.do";
	}
}