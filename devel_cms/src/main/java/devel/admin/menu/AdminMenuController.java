package devel.admin.menu;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import devel.admin.menu.service.AdminMenuService;
import devel.cmmn.base.BaseController;
import jakarta.servlet.http.HttpSession;
import tools.jackson.databind.ObjectMapper;

/**
 * 관리자 메뉴 관리를 위한 컨트롤러
 * @Class Name   : AdminMenuController
   @Description  : 관리자 메뉴 동작을 위한 컨트롤러

 * @author  : PJC
 * @date    : 2026. 1. 19
 * @desc    :
 * @version : 1.0
 * @see
 *
 * 개정이력(Modification Information)
 * 수정일		      수정자	     내용
 * ----------------  --------  -----------------
 *  2026. 1. 19		PJC			최초생성
 **/

@Controller
@RequestMapping("/admin/menu")
public class AdminMenuController  extends BaseController{

	@Autowired
	private AdminMenuService adminMenuService;

	/**
     * 메뉴관리
     * @Method : list
     * @param request
     * @param response
     * @param throws
     * @throws Exception
     * @return : String
     */
	@PostMapping(value ="/list.do")
	public String list(@RequestParam Map<String, Object> param
			, ModelMap model, HttpSession session) throws Exception {

		if(param.get("siteCode") == null || "".equals(param.get("siteCode"))) {
			param.put("siteCode", "admin");
		}

		// jstree에 json 형태로 넣어줘야 하기 때문에 변환
		List<Map<String, Object>> jsonData = adminMenuService.getMenuList(param);
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(jsonData);

		model.addAttribute("jsonString", jsonString);

		return adminLayout(model, "/WEB-INF/views/admin/menu/list");

	}
}
